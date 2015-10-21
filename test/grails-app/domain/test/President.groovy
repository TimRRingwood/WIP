package test

class President {

	String firstName
	String lastName
	
    static constraints = {
		firstName(blank:false, nullable:false, maxSize: 50)
		lastName(blank:false, nullable:false, maxSize: 50)
    }
}
