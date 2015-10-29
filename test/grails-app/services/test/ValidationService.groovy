package test

import java.text.DateFormat
import java.text.SimpleDateFormat



class ValidationService {
	
	static List allFields = Arrays.asList("firstname", "lastname", "email", "immigrantAlien", "alienNumb", "alienExp", "phone",
		   "email2", "phone2", "city", "state", "zipcode", "company", "orgID", "preferredUsernames", "preferredShell", "pocFirstname", "pocLastname", "pocEmail");
	static def emailPattern = /[_A-Za-z0-9-]+(.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})/
	static def phonePattern = /\d{3}-\d{3}-\d{4}/
	static def zipcodePattern = /^\d{5}(?:[-\s]\d{4})?$/
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
			error = !value ? "[" + field + "] Required" : null
		}
	    error != null ? error : ""
   }
   
   
   private String emailValidation(def val, def params) {
	   String error;
	   if (!val) {
		   error = "Primary Email Required"
	   }
	   else if (!(val ==~ emailPattern)) {
		   error = "Primary Email Invalid."
	   }
	   return error;
   }
   
   private String email2Validation(def val, def params) {
	    val && !(val ==~ emailPattern) ? "Alternate Email Invalid " : null
   }
   
   private String zipcodeValidation(def val, def params) {
	   String error;
	   if (!val) {
		   error = "Zip Code Required"
	   }
	   else if (!(val ==~ zipcodePattern)) {
		   error = "Zip Code Invalid."
	   }
	   return error;
   }
   
   private String phoneValidation(def val, def params) {
	   String error
	   if (!val) {
		   error = "Primary Phone Required"
	   }
	   else if (!(val ==~ phonePattern)) {
		   error = "Primary Phone must be in the form ###-###-####."
	   }
   }
   
   private String phone2Validation(def val, def params) {
	   val && !(val ==~ phonePattern) ? "Alternate Phone must be in the form ###-###-####. " : null
   }
   
   private String faxValidation(def val, def params) {
	   val && !(val ==~ phonePattern) ? "Fax must be in the form ###-###-####. " : null
   }
   
   private String immigrantAlienValidation(def val, def params) {
	   !val && !isUnitedStatesCitizen(params) ? "Immigrant Alien Required" : null
   }
   
   private String alienNumbValidation(def val, def params) {
	   !val && !isUnitedStatesCitizen(params) ? "Alien Registration Required" : null
   }
   
   private String alienExpValidation(def val, def params) {
	   String error
	   if (!isUnitedStatesCitizen(params)) {
		   if (!val) {
			   error = "Alien Expiration Required"
		   } 
		   else if (!isDateValid(val)) {
			   error = "Alien Expiration Date Is Not Valid"
		   }
	   }
   }
   
   private String pocFirstnameValidation(def val, def params) {
	   println "poc first name validation"
	   !val && !isGovEmp(params) ? "Point of Contact First Name Required" : null
   }
   
   private String pocLastnameValidation(def val, def params) {
	   !val && !isGovEmp(params) ? "Point of Contact Last Name Required" : null
   }
   
   private String pocEmailValidation(def val, def params) {
	   def error 
	   if (!isGovEmp(params)) {
		   if (!val) {
			   error = "Point of Contact Email Required"
		   }
		   else if (!(val ==~ emailPattern)) {
			   error = "Point of Contact Email Is Not Valid"
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
