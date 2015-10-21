package test;

//import com.grygoriy.bruteforcedefender.LoginAttemptCacheService
import com.megatome.grails.RecaptchaService

import test.LoginInfo;

class InfoUsersController {
    def scaffold = "infoUsers"
	RecaptchaService recaptchaService
	LoginService loginService
	def static  failures = new HashMap<String, Integer>();
	//static scope = "flow"

    def transient sessionFactory
	
	def test = {
		render "  test2 "
	}

    def buildFlow = {
        enter {
            action {
                InfoUsers flow.info = new InfoUsers()
                [info: flow.info]
            }
            on("success").to("splash")
            on(Exception).to("error")
        }
		splash {
			on("login") {
				
				BuildInfoUsersNameCommand command ->
				//def atest = recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params);
				//print "at test" + atest
				println "login attempt"
		
			}.to("login") 
			on("create") {
				//GenCommand command ->
				
				    //def roles = Role.findAll()
					//println "Roles " + roles
					//bindData(flow.roles, roles)
					//[roles: roles]
				
			}.to("create")
			on(Exception).to("error")
		}
		create {
			on('next') { 
			
				
				LoginCommand command ->
				if (command.hasErrors()) {
					flash.message = "Validation error"
					flow.command = command
					return error()
				}
				String pwd = loginService.getPassword() 
				println "PWD: " + pwd
				def newUser = loginService.createNewUser(params.username, pwd)
				newUser.password = pwd
				def info = newUser.infoUsers;
				
				if (info == null) {
					info = new InfoUsers()
				}
				[user: newUser, info: info, pwd: pwd]
				
	            //println "new user: " + newUser

				//bindData(flow.user, newUser)
				//[pwd: pwd]
			}.to('pieinfo')
			on('cancel').to('slash')
			on(Exception).to("error")
		}
		login {
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
			on(Exception).to("error")
		}
		pieinfo { 
            on('next') { 
			
				BuildInfoUsersNameCommand command ->
                if (command.hasErrors()) {
                    flash.message = "Validation error"
                    flow.command = command
                    return error()
                }
				def user = LoginInfo.read(params.userId)
		        //def info = InfoUsers.findByLoginInfoId(params.userId);
				def info = user.infoUsers
				println "P: " + params.userId
				if (info == null) {
					println "Getting new info"
					def newInfo  = new InfoUsers();
					newInfo.assignParams(params);
					println "LoginInfoId: " + newInfo.loginInfoId
					//newInfo.loginInfoId = params.userId;
					newInfo.save();
					info = newInfo
				//	//info.userId = params.userId;
				}
				else {
				       info.assignParams(params);
					   info.save(flush: true)
					  //info.dualCitizenship = params.dualCitizenship
					  //info.immigrantAlien = params.immigrantAlien
				}
				
				//println "i: " + info
				//info.save(){
				//println info.errors.allErrors.join(' \n') //each error is an instance of  org.springframework.validation.FieldError
			    //}
			
					  
				println "INFO: " + info
				//bindData(flow.info, command)
                [info: info]
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


