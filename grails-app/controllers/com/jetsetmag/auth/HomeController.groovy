package com.jetsetmag.auth

import grails.plugin.springsecurity.SecurityConfigType
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class HomeController {

	/**
	 * Dependency injection for the springSecurityService.
	 */
	def springSecurityService
	
	/**
	 * Dependency injection for the SpringSecurityUtils. //  securityConfig
	 */
	def config = SpringSecurityUtils.securityConfig
	
    def index = {
		User currentUser
			
		if (springSecurityService.isLoggedIn()) {
			currentUser = springSecurityService.getCurrentUser() // loadCurrentUser()
			//println currentUser.getEmail()
			//println currentUser.email
		}
		
		render view : 'index' , model : [currentUser:currentUser]	
	}

	def login = {

		if (springSecurityService.isLoggedIn()) {
			redirect uri: config.successHandler.defaultTargetUrl
			return
		}

		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		render view: 'signin', model: [postUrl: postUrl,
		                           rememberMeParameter: config.rememberMe.parameter,successUrl:config.successHandler.defaultTargetUrl]		
	}
	
	def logout = {		
		if (springSecurityService.isLoggedIn()) {
	        session.invalidate()
			redirect uri: config.logout.filterProcessesUrl
			////redirect(controller:'home',action:'index')
		}
		
		render view: 'index'
	}

	def register = {		
		if(!springSecurityService.isLoggedIn()) {
			if(request.post){
				def user = new User(email:params['email'],username:params['login'],password:params['password'],firstName:params['firstn'],lastName:params['lastn'])
				if (user.save(flush: true)) {
					// def guest role by default
						def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
						UserRole.create testUser, userRole, true
					flash.success = "Thank you for signing up to our JetSet Magazine!"
					redirect(controller:'home',action:'index')
				}else{
					flash.warning = "An error !"
					redirect(controller:'home',action:'register')
				}
			}else{
				render view : 'signup'
			}
		}else{
			redirect(controller:'home',action:'index')
		}		
	}
	
	def downloadApp = {		
		// télécharger l'application java swing		
	}
	
}
