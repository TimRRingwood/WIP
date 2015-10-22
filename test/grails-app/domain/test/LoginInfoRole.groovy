package test

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class LoginInfoRole implements Serializable {

	private static final long serialVersionUID = 1

	LoginInfo user
	Role role

	LoginInfoRole(LoginInfo u, Role r) {
		this()
		user = u
		role = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof LoginInfoRole)) {
			return false
		}

		other.user?.id == user?.id && other.role?.id == role?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static LoginInfoRole get(long loginInfoId, long roleId) {
		criteriaFor(loginInfoId, roleId).get()
	}

	static boolean exists(long loginInfoId, long roleId) {
		criteriaFor(loginInfoId, roleId).count()
	}

	private static DetachedCriteria criteriaFor(long loginInfoId, long roleId) {
		LoginInfoRole.where {
			user == LoginInfo.load(loginInfoId) &&
			role == Role.load(roleId)
		}
	}

	static LoginInfoRole create(LoginInfo user, Role role) {
		println "UserRole  create"
		def instance = new LoginInfoRole(user, role)
		instance.save(flush: true, insert: true)
		instance
	}
	
	private static saveUser(LoginInfo login, Role role) {
		
	}

	static boolean remove(LoginInfo u, Role r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = LoginInfoRole.where { user == u && role == r }.deleteAll()

		if (flush) { LoginInfoRole.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(LoginInfo u, boolean flush = false) {
		if (u == null) return

		LoginInfoRole.where { user == u }.deleteAll()

		if (flush) { LoginInfoRole.withSession { it.flush() } }
	}

	static void removeAll(Role r, boolean flush = false) {
		if (r == null) return

		LoginInfoRole.where { role == r }.deleteAll()

		if (flush) { LoginInfoRole.withSession { it.flush() } }
	}

	static constraints = {
		role validator: { Role r, LoginInfoRole ur ->
			if (ur.user == null || ur.user.id == null) return
			boolean existing = false
			LoginInfoRole.withNewSession {
				existing = LoginInfoRole.exists(ur.user.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['user', 'role']
		version false
	}
}
