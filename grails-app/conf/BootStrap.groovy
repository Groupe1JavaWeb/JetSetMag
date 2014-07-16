import com.jetsetmag.auth.Role
import com.jetsetmag.auth.User
import com.jetsetmag.auth.UserRole

class BootStrap {
	
    def init = { servletContext ->
		
		/*def superUserRole = new Role(authority: 'ROLE_SUPERADMIN').save(flush: true) 		// OK
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true) 			// OK
		def memberRole = new Role(authority: 'ROLE_MEMBER').save(flush: true) 		// OK
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true) // guest 	// OK
  
		def testUser = new User(username: 'test1', password: '123456',firstName:"test1",lastName:"test1",email:"test1@test.com").save(flush: true) // OK
		
		UserRole.create testUser, userRole, true
  
		// unit-testing
		assert User.count() == 1
		assert Role.count() == 4		// OK
		assert UserRole.count() == 1*/
		
    }
    def destroy = {
    }
}
