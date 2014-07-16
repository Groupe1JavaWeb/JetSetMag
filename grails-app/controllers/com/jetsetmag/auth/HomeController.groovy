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
		
		if(!session.currentUser){		
			if ( springSecurityService.isLoggedIn() ) {
				session.currentUser = springSecurityService.getCurrentUser() ;
			}
		}
		
		render view : 'index' // Session currentUser is ON
	}

	def login = {
		if ( session.currentUser ) {
			redirect uri: config.successHandler.defaultTargetUrl
			//redirect(controller:'home',action:'index')
			return
		}

		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		render view: 'signin', model: [postUrl: postUrl,
		                           rememberMeParameter: config.rememberMe.parameter,successUrl:config.successHandler.defaultTargetUrl]		
	}
	
	def logout = {		
		if ( session.currentUser ) {
	        session.currentUser=null
			session.invalidate()
			redirect uri: config.logout.filterProcessesUrl
			//redirect(controller:'home',action:'index')
		}
		
		render view: 'index'
	}

	def register = {		
		if( !session.currentUser ) {
			if(request.post){
				def user = new User(email:params['email'],username:params['login'],password:params['password'],firstName:params['firstn'],lastName:params['lastn'])
				if (user.save(flush: true)) {
					// ROLE_USER by default and it's a disabled account
						def Role = Role.findByAuthority('ROLE_USER')
						UserRole.create user, Role, true
					flash.success = "Thank you for signing up to our JetSet Magazine !"
					redirect(controller:'Home',action:'index')
				}else{
					flash.warning = "An error !"
					redirect(controller:'Home',action:'register')
				}
			}else{
				render view : 'signup'
			}
		}else{
			redirect(controller:'home',action:'index')
		}
	}
	
	def downloadApp = {		
		render view : 'download'		
	}
	
}