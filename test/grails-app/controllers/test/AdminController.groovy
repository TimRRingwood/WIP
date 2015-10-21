package test

class AdminController {

    def users() { 
		
		def users = LoginInfo.findAll()
		def i =  LoginInfo.count();
		println "U: " + users
		println "I: " + i
		['users' : users]
	}
}
