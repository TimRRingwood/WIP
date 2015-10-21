package test

import grails.transaction.Transactional

class LoginService {
	private static transactional = false
	private static ipTracker = new HashMap<String, Integer>()
	def grailsApplication
	
	def int getMaxUserFailure() {
		return grailsApplication.config.login.maxUserFailedAttempts
	}

	def int getMaxIPFailure() {
		return grailsApplication.config.login.maxIPFailedAttempts
	}

	
    def LoginInfo createNewUser(String username, String password) {
		InfoUsers info = new InfoUsers()
		//info.save();
		
		LoginInfo newUser = new LoginInfo(username, password)
		newUser.infoUsers = info;
		newUser.failedAttempts = 0
		newUser.accountLocked = false
		newUser.save(flush: true)
		return newUser;
    }
	
	def boolean ipFailureCheck(String ipAddress) {
	    Integer failureCt =  ipTracker.get(ipAddress);
		return failureCt != null && failureCt >= getMaxIPFailure()
	}
	
	def LoginInfo getUserLogin(String username) {
	    LoginInfo user = LoginInfo.findByUsername(username)
		if (user != null && user.failedAttempts > getMaxUserFailure()) {
			user.accountLocked = true
		}
		else {
			user.accountLocked = false
		}
		return user
	}
	
	def void upIPFailureCount(String ipAddress) {
		Integer failureCt =  ipTracker.get(ipAddress);
		if (failureCt == null) {
			failureCt = 0;
		}
		ipTracker.put(ipAddress, ++failureCt)
    }
	
	def void upUserFailureCount(LoginInfo login) {
		Integer failureCt =  login.failedAttempts
		if (failureCt == null) {
			failureCt = 0;
		}
		login.failedAttempts = ++failureCt
		login.save(flush: true)
	}
	
	def void resetFailures(LoginInfo login, String ipAddress) {
		ipTracker.remove(ipAddress)
		if (login.failedAttempts != null && login.failedAttempts > 0) {
			login.failedAttempts = 0
			login.accountLocked = false
			login.save(flush: true)
		}
		
	}
}
