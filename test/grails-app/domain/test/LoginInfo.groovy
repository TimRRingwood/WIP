package test


class LoginInfo implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	Integer failedAttempts;
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	//Integer 
	boolean passwordExpired
	InfoUsers infoUsers
	
	static hasOne = [infoUsers:InfoUsers]
	//static hasOne = [infoUsers: InfoUsers]
	//static belongsTo = [infoUsers: InfoUsers]	

	LoginInfo(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof LoginInfo && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		LoginInfoRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
	
	public boolean isPasswordOK(def pwd) {
		println "is password OK: " + this
		def a = springSecurityService?.passwordEncoder?.isPasswordValid(this.password,pwd, null)
		println "AOK " + a
		return a
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		//infoUsers unique: true
		failedAttempts blank: true, null: true
	}

	static mapping = {
		password column: '`password`'
	}
}
