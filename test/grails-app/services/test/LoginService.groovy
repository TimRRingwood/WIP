package test

import grails.transaction.Transactional

class LoginService {
	private static transactional = false
	private static ipTracker = new HashMap<String, Integer>()
	private static def upperAlpha = ['A'..'Z'].flatten()
	private static def lowerAlpha = ['a'..'z'].flatten()
	private static def numbers = ['0'..'9'].flatten()
	private static def specialChars = ['^', '#', '*', '!', ':', '\$'].flatten()
	def grailsApplication

	def int getMaxUserFailure() {
		return grailsApplication.config.login.maxUserFailedAttempts
	}

	def int getMaxIPFailure() {
		return grailsApplication.config.login.maxIPFailedAttempts
	}


	def LoginInfo createNewUser(String username, String password) {
		InfoUsers info = new InfoUsers()

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

	def String getPassword() {
		def pool = upperAlpha + lowerAlpha + numbers + specialChars;
		def upperAlphaCt = 0;
		def lowerAlphaCt = 0;
		def numbersCt = 0;
		def specialCharsCt = 0;

		Random rand = new Random(System.currentTimeMillis())
		StringBuilder sb = new StringBuilder()
		def lastChar = " ";
		def x = " "
		for (int i = 0; i < 15; i++) {
			// Need to have two each, so lets check how we are doing
			if (i > 10) {
				// If not enough of a set set pool to that set to force it to pick that one
				if (upperAlphaCt < 2) {
					pool = upperAlpha;
				}
				else if (lowerAlphaCt < 2) {
					pool = lowerAlpha;
				}
				else if (numbersCt < 2) {
					pool = numbers;
				}
				else if (specialCharsCt < 2) {
					pool = specialChars;
				}
				// All conditions have been met
				else {
					pool = upperAlpha + lowerAlpha + numbers + specialChars;
				}
			}
			// Attempt to shuffle list of items as random isn't that random
			long seed = System.nanoTime();
			Collections.shuffle(pool, new Random(seed));
			// Same character can't be repeated
			while (x == lastChar) {
				x = pool[rand.nextInt(pool.size())]
			}
			lastChar = x;

			// Up counters on character types
			if (upperAlpha.contains(x)) {
				upperAlphaCt++
			}
			else if (lowerAlpha.contains(x)) {
				lowerAlphaCt++
			}
			else if (numbers.contains(x)) {
				numbersCt++
			}
			else if (specialChars.contains(x)) {
				specialCharsCt++;
			}

			sb.append(x);
		}

		return sb.toString();
	}
}
