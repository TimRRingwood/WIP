
import test.InfoUsers
import test.President
import test.Role
import test.LoginInfo
import test.UserRole

class BootStrap {

	def init = {
		
			  //def adminRole = new Role('ROLE_ADMIN').save()
		      def adminRole = Role.findByAuthority('ROLE_ADMIN');
			  println "AdminRole: " + adminRole
			  //def userRole = new Role('ROLE_USER').save()
			  
			  def info = new InfoUsers();
		
		      //info.loginInfoId = 21
			  
			  //info.save();
			  
			  //def testUser = new LoginInfo('aaa', 'aaa').save()
			  def testUser = LoginInfo.findByUsername('tim');
			  println "TestUSer: " + testUser
		
			 // UserRole.create testUser, adminRole
			  //UserRole ur = new UserRole(testUser, adminRole);
			  //ur.save(flush: true)
			  //println "UR: " + ur
			  
			  //instance.save(flush: true, insert: true)
		
		      def p = new President();
			  p.firstName = 'Bill'
			  p.lastName = 'Clinton'
			  p.version = 1
			  //p.save();
		
		      //println ('create new contact')
		      //def c = new Contact();
			  //c.userId = 2;
			  //c.firstname = 'tst'
			  //c.version = 0;
		      //c.save();
			  //assert Contact.count() == 1
			  //assert Role.count() == 2
			  //assert UserRole.count() == 1 
	}
    def destroy = {
    }
}
