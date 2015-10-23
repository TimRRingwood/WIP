package test;

//import com.grygoriy.bruteforcedefender.LoginAttemptCacheService
import com.megatome.grails.RecaptchaService
import grails.plugin.springsecurity.SpringSecurityService

import test.LoginInfo;

class InfoUsersController {
	def scaffold = "infoUsers"
	RecaptchaService recaptchaService
	LoginService loginService
	SpringSecurityService springSecurityService
	def static  failures = new HashMap<String, Integer>();
	//static scope = "flow"

	def transient sessionFactory

	def test = { render "  test2 " }

	def buildFlow = {
		enter {
			action { println " enter action " }
			on("success") {
				def authUser = springSecurityService.currentUser
				if (authUser == null) {
					throw new NullPointerException()

				}
			}.to("pieinfoAuth")
			on(Exception).to("splash")
		}
		splash {
			on("login").to("login")
			on("create").to("create")
			on(Exception).to("error")
		}
		create {
			on('next') { GenCommand command ->

				//Verify Recaptcha was right
				if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)) {
					//loginService.upIPFailureCount(ipAddress);
					flash.message = "Show you are human"
					return error()
				}
				recaptchaService.cleanUp(session)

				def info = new InfoUsers()
				def user =  new LoginInfo()
                user.id = -1
				[user: user, info: info]
				//String pwd = loginService.getPassword()
				//println "PWD: " + pwd
				//def newUser = loginService.createNewUser(params.username, pwd)
				//newUser.password = pwd

				//[user: newUser, info: info, pwd: pwd]

			}.to('pieinfo')
			on('cancel').to('slash')
			on(Exception).to("error")
		}
		login {
			redirect(controller: "login", action: "auth")
			on('next') { LoginCommand command ->

				def ipAddress = params.ipAddress;
				if (loginService.ipFailureCheck(ipAddress)) {
					flash.message = "Too many attenpts"
					return error();
				}

				//Verify Recaptcha was right
				if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)) {
					loginService.upIPFailureCount(ipAddress);
					flash.message = "Show you are human"
					return error()
				}
				recaptchaService.cleanUp(session)

				if (command.hasErrors()) {
					flash.message = "Validation error"
					loginService.upIPFailureCount(ipAddress);
					flow.command = command
					return error()
				}
				InfoUsers info = new InfoUsers()
				def ok = false;
				def user = loginService.getUserLogin(params.username)
				if (user != null) {
					if (user.accountLocked) {
						flash.message = "User Locked Out Due To Many Failures"
						flow.command = command
						return error()
					}
					else {
						//info = InfoUsers.findByLoginInfoId(user.id);
						info = user.infoUsers
						ok = user.isPasswordOK(params.password)
						if (!ok && 	user != null) {
							loginService.upUserFailureCount(user)
						}
					}
				}

				if (!ok) {
					flash.message = "User not found"
					loginService.upIPFailureCount(ipAddress);
					flow.command = command
					return error()
				}
				if (info == null) {
					info = new InfoUsers()
				}
				loginService.resetFailures(user, ipAddress)
				[user: user, info: info]
			}.to('pieinfo')
			on('cancel').to('splash')
			on("return").to('splashy')
			on(Exception).to("error")
		}
		pieinfoAuth {
			action {  }
			on('success') {
				def authUser = springSecurityService.currentUser
				[user: authUser, info: authUser?.infoUsers]
			}.to("pieinfo")
		}
		pieinfo {
			on('save') { BuildInfoUsersNameCommand command ->
				if (command.hasErrors()) {
					flash.message = "Validation error"
					flow.command = command
					return error()
				}
				def user
				def pwd
				def userId = params.int('userId');
				println "UID: " + userId
				if (userId == -1) {
					String email = params.email
					print "EMAIL " + email
					if (email == null || email.empty) {
						 print "NO email"
						flash.message = "Email Required For New Account"
						flow.command = command
						return error()
					}
					pwd = loginService.getPassword()
					println "PWD: " + pwd
					user = loginService.createNewUser(email, pwd)
					println ("USER: " + user)
					user.password = pwd
				}
				else {
					println "Getting from database"
				    user = LoginInfo.read(params.userId)
				}
				def info = user.infoUsers
				println "P: " + params.userId
				// In abstract info should never be null as a new user creates an info row in the db
				if (info == null) {
					def newInfo  = new InfoUsers();
					newInfo.assignParams(params);
					newInfo.save();
					info = newInfo
					user = newInfo
					user.save(flush: true)
				}
				else {
					info.assignParams(params);
					info.save(flush: true)
				}

				println "INFO: " + info
				//bindData(flow.info, command)
				[info: info, pwd: pwd]
			}.to('pieinfo')
			on('cancel').to('finish')
		}
		address {
			on('next').to('finish')
			on('previous').to('pieinfo')
			on('cancel').to('finish')
		}

		complete {
			on('next') {
				if (!flow.info.save()) {
					flash.message = "Couldn't save the info"
					return error()
				}
			}.to('finish')
			on('previous').to('electronic')
			on('cancel').to('finish')
			on(Exception).to('error')
		}
		error {
			on('confirm').to('finish')
		}
		finish {
			redirect(controller: 'info', action: 'list')
		}
	}

}

class BuildInfoUsersNameCommand implements Serializable {
	String firstname
	String lastname

	static constraints = {
		firstname(blank:true, nullable:false, maxSize: 50)
		lastname(blank:true, nullable:false, maxSize: 50)
	}

}


class LoginCommand implements Serializable {

	String username
	//String password
	//LoginInfo user

	static constraints = {
		username(blank:false, nullable:false, maxSize: 50)
		//password(blank:false, nullable:false, maxSize: 50)
	}

}


class GenCommand implements Serializable {


}


