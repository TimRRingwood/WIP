package test

import java.text.DateFormat
import java.text.SimpleDateFormat
import org.codehaus.groovy.grails.commons.GrailsApplication
import org.springframework.context.MessageSource
import org.codehaus.groovy.grails.plugins.web.taglib.ValidationTagLib

class ValidationService {
	
	static List allFields = Arrays.asList("firstname", "lastname", "email", "immigrantAlien", "alienNumb", "alienExp", "phone",
		   "email2", "phone2", "city", "state", "zipcode", "company", "orgID", "preferredUsernames", "preferredShell", "pocFirstname", "pocLastname", "pocEmail");
	static def emailPattern = /[_A-Za-z0-9-]+(.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})/
	static def phonePattern = /\d{3}-\d{3}-\d{4}/
	static def zipcodePattern = /^\d{5}(?:[-\s]\d{4})?$/
	static GrailsApplication grailsApplication
	static def validatinTagLib = new ValidationTagLib()


	
	def Map validateAll(params) {
		Map<String, String> errors = new HashMap()
		allFields.each { field ->
			def value = params."${field}"
			def errorMsg =  validateField(field, value, params)
			if (errorMsg) {
				errors.put(field, errorMsg)
			}
		}
	    errors = errors.sort { it.value}
	}
	
	def String validateField(def field, def value, def params) {
		
		def error 
		def methodName  = field + "Validation"
		if (this.metaClass.respondsTo(this, methodName)) {		
			error = "$methodName"(value, params)
		}
		else { // if no method, default is to check if required.
			def msg = validatinTagLib.message(error: field + ".errorRequired")
			if (!msg) {
				msg = field + " Required."
			}
			error = !value ? msg : null
		}
	    error != null ? error : ""
   }
   
   
   private String emailValidation(def val, def params) {
	   String error;
	   if (!val) {
		   error = getMessage("email.errorRequired")
	   }
	   else if (!(val ==~ emailPattern)) {
		   error = getMessage("email.errorInvalid")
	   }
	   return error;
   }
   
   private String email2Validation(def val, def params) {
	    val && !(val ==~ emailPattern) ? getMessage("email2.errorInvalid") : null
   }
   
   private String zipcodeValidation(def val, def params) {
	   String error;
	   if (!val) {
		   error = getMessage("zipcode.errorRequired")
	   }
	   else if (!(val ==~ zipcodePattern)) {
		   error = getMessage("zipcode.errorInvalid")
	   }
	   return error;
   }
   
   private String phoneValidation(def val, def params) {
	   String error
	   if (!val) {
		   error = getMessage("phone.errorRequired")
	   }
	   else if (!(val ==~ phonePattern)) {
		   error = getMessage("phone.errorInvalid")
	   }
   }
   
   private String phone2Validation(def val, def params) {
	   val && !(val ==~ phonePattern) ? getMessage("phone2.errorInvalid") : null
   }
   
   private String faxValidation(def val, def params) {
	   val && !(val ==~ phonePattern) ? getMessage("fax.errorInvalid") : null
   }
   
   private String immigrantAlienValidation(def val, def params) {
	   !val && !isUnitedStatesCitizen(params) ? getMessage("immigrantAlien.errorRequired") : null
   }
   
   private String alienNumbValidation(def val, def params) {
	   !val && !isUnitedStatesCitizen(params) ?  getMessage("alienNumb.errorRequired") : null
   }
   
   private String alienExpValidation(def val, def params) {
	   String error
	   if (!isUnitedStatesCitizen(params)) {
		   if (!val) {
			   error = getMessage("alienExp.errorRequired")
		   } 
		   else if (!isDateValid(val)) {
			   error = getMessage("alienExp.errorInvalid")
		   }
	   }
   }
   
   private String pocFirstnameValidation(def val, def params) {
	   !val && !isGovEmp(params) ? getMessage("pocFirstname.errorRequired") : null
   }
   
   private String pocLastnameValidation(def val, def params) {
	   !val && !isGovEmp(params) ? getMessage("pocLastname.errorRequired") : null
   }
   
   private String pocEmailValidation(def val, def params) {
	   def error 
	   if (!isGovEmp(params)) {
		   if (!val) {
			   error = getMessage("pocEmail.errorRequired")
		   }
		   else if (!(val ==~ emailPattern)) {
			   error = getMessage("pocEmail.errorInvalid")
		   }
	   }
	   error
   }
   
   private boolean isUnitedStatesCitizen(def params) {
	   1 == params.int('citizen1') || 1 == params.int('citizen2')
   }
   
   private boolean  isGovEmp(def params) {
	   params.boolean('isGovEmp')
   }
   
   private String getMessage(String msgKey) {
	  validatinTagLib.message(error: msgKey)
   }
   
   private boolean isDateValid(String dt) {
	   boolean valid = false
	   try {
		   DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		   dateFormat.setLenient(false);
		   dateFormat.parse(dt)
		   valid = true
	   } catch(java.text.ParseException p) {
		   //println "Unparseable Date"
	   }
	   valid
   }
   
   def methodMissing(String name, args) {
	   name + " missing (internal error)"
   }
	
}
