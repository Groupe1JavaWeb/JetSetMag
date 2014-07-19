package com.jetsetmag.auth

import com.jetsetmag.hangout.Event
import com.jetsetmag.hangout.Comment
import com.jetsetmag.auth.User


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
		
		render view : 'index',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)] // Session currentUser is ON
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

	def search = {

		def infoMsg = ""
		def dangerMsg = ""
		def successMsg = ""
		def warningMsg = ""
		def resU
		def resE
		if(request.post){
			
			////////// Users Search
			resU = User.search("${params.searchField}")
			if(resU.total>0){
				infoMsg <<  "Found ${res.total} result(s) in users !"
				resU.searchResults.each {
					if(it instanceof User) {
						successMsg << " A user { "+it.username+" } was found !"
					} else {
						dangerMsg << " This user { "+it.username+" } was found and protected !"
					}
				}
			}else{
				warningMsg << "No user found !"
			}
			
			////////// Events Search
			resE = Event.search("${params.searchField}")
			if(resE.total>0){
				infoMsg <<  "Found ${res.total} result(s) in event !"
				resE.searchResults.each {
					if(it instanceof Event) {
						successMsg << " A event { "+it.title+" } was found !"
					} else {
						dangerMsg << " This event { "+it.title+" } was found and protected !"
					}
				}
			}else{
				warningMsg << "No event found !"
			}
			
		}
		
		flash.info=infoMsg
		flash.danger=dangerMsg
		flash.success=successMsg
		flash.warning=warningMsg

		redirect(controller:'Home',action:'index',model : [commentsCount:Comment.list(),usersCount:User.count(),eventsCount:Event.count(),resU:resU,resE:resE])
		
	}

}