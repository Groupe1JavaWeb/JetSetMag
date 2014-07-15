import grails.plugin.springsecurity.SpringSecurityService;

import com.jetsetmag.auth.Role;
import com.jetsetmag.auth.User;
import com.jetsetmag.auth.UserRole;

class BootStrap {

	def springSecurityService
	
    def init = { servletContext ->
		def superUserRole = new Role(authority: 'ROLE_SUPERUSER').save(flush: true) 		// OK
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true) 			// OK
		def memberRole = new Role(authority: 'ROLE_MEMBER').save(flush: true) 		// OK
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true) // guest 	// OK
		
		//def passWdCrypted = SpringSecurityService.encodePassword("marwen") ;
  
		def testUser = new User(username: 'tech_num_1', password: '123456',firstName:"Tech1",lastName:"Jet 7 Magazine",email:"tech1@arfaoui-marouene.tn",created:new Date(),modified:new Date(),lastConnection:new Date(),accountExpired:false,passwordExpired:false,accountLocked:false).save(flush: true) // OK
		//def testUser = new User(username: 'tech_num_1', password: passWdCrypted,firstName:"Tech1",lastName:"Jet 7 Magazine",email:"tech1@arfaoui-marouene.tn",created:new Date(),modified:new Date(),lastConnection:new Date(),accountExpired:false,passwordExpired:false,accountLocked:false).save(flush: true) // NOK
		
		UserRole.create testUser, userRole, true
  
		// unit-testing
		assert User.count() == 1
		assert Role.count() == 4		// OK
		assert UserRole.count() == 1
		
    }
    def destroy = {
    }
}
