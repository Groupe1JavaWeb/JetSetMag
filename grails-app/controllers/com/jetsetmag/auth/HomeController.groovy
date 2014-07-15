package com.jetsetmag.auth

import org.springframework.security.access.annotation.Secured

@Secured(['permitAll'])
class HomeController {
	
	def springSecurityService // injection automatique de springSecurityService
	
    def index = {
		render view : 'index'
	}

	def login = {
		//if (springSecurityService.isLoggedIn()) {
		//	render view : 'index'
		//}else{		
			render view : 'signin' // juste on va afficher le formulaire SpringSecurityAuth personnalisé
		//}
	}
	
	def logout = {
		//if (springSecurityService.isLoggedIn()) {
			// 1 unset session and the current user from the application 
				
			// 2
				render view : 'index'
		//}else{		
		//	render view : 'index' // juste on va afficher le formulaire SpringSecurityAuth personnalisé
		//}
	}

	def register = {
		render view : 'signup'
	}
	
}
