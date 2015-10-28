package test



class ValidationService {
	
	static List allFields = Arrays.asList("firstname", "lastname", "email");
	
	def Map validateAll(params) {
		Map<String, String> errors = new HashMap()
		allFields.each { field ->
			def value = params."${field}"
			def errorMsg =  validateField(field, value)
			if (errorMsg) {
				errors.put(field, validateField(field, value))
			}
		}
		errors
	}
	
	def String validateField(def field, def value) {	
		def methodName  = field + "Validation"
		def error = "$methodName"(value)
		return error != null ? error : ""
   }

	def String firstnameValidation(val) {
		String error;
		if (!val) {
			error = "First Name Required"
		}
		return error;
   }
	
   def String lastnameValidation(val) {
	   String error;
	   if (!val) {
		   error = "Last Name Required"
	   }
	   return error;
   }
   
   def String emailValidation(val) {
	   String error;
	   if (!val) {
		   error = "Email Required"
	   }
	   return error;
   }
	
}
