
import test.InfoUsers
import test.LoginService
import test.Role
import test.LoginInfo
import test.LoginInfoRole

class BootStrap {

	def LoginService loginService 
	def init = {
		
		      def adminRole = Role.findByAuthority('ROLE_ADMIN');
			  if (adminRole == null) {
				  adminRole = new Role('ROLE_ADMIN').save()
				  new Role('ROLE_USER').save()
			  }

			  def adminUser = LoginInfo.findByUsername('admin');
			  if  (adminUser == null) {
				  adminUser = loginService.createNewUser('admin', 'pwd');
				  def iu = adminUser.infoUsers
				  iu.firstname = 'Super'
				  iu.lastname = "User"
				  iu.save(flush: true)
				  //adminUser = new LoginInfo('su', 'pwd').save()
				  LoginInfoRole ur = new LoginInfoRole(adminUser, adminRole);
				  ur.save(flush: true)
			  }

	}
    def destroy = {
    }
}
