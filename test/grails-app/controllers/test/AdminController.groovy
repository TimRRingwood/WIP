package test

import grails.plugin.springsecurity.annotation.Secured

class AdminController {
    LoginService  loginService
	
	@Secured('ROLE_ADMIN')
    def users() {	
		def users = getUserList()
		println "Users: " + users
		['users' : users]
	}
	
	@Secured('ROLE_ADMIN')
	def resetLogin() {
		def login = loginService.getUserLogin(params.username)
		loginService.resetFailureAttmpts(login)
		def users = getUserList()
		render(view: "users",  model: ['users': users])
	}
	
	private def getUserList() {
		def users = LoginInfo.findAll()
		return users;
	}
}
