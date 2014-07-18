import com.jetsetmag.auth.Role
import com.jetsetmag.auth.User
import com.jetsetmag.auth.UserRole

class BootStrap {
	
    def init = { servletContext ->
		
		//def superAdminRole = new Role(authority: 'ROLE_SUPERADMIN').save(flush: true) 		// OK
		//def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true) 			// OK
		//def memberRole = new Role(authority: 'ROLE_MEMBER').save(flush: true) 		// OK
		//def userRole = new Role(authority: 'ROLE_USER').save(flush: true) // guest 	// OK
  
		//def rootUser = new User(username: 'Jet7m@gVipR', password: '7mAgHi#1',firstName:"Jet7God",lastName:"Her I am",email:"me@arfaoui-marouene.tn",enabled:true).save(flush:true) // OK
		
		//UserRole.create rootUser, superAdminRole, true
		//UserRole.create rootUser, Role.findByAuthority('ROLE_SUPERADMIN'), true
  
		// unit-testing
		//assert User.count() == 1
		//assert Role.count() == 4		// OK
		//assert UserRole.count() == 1
		
    }
    def destroy = {
    }
}
