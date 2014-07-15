package com.jetsetmag.auth

import org.springframework.web.servlet.mvc.Controller;

import com.jetsetmag.auth.User;

import grails.plugin.springsecurity.annotation.Secured

class UserController {
	
	//static scaffold = true
	
	//def beforeInterceptor = [action:this.&checkUser,except:['login','register']] // init function // 'list','show',

	/*def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			//redirect(controller:'home',action:'index')
			//redirect(controller:'user',action:'index')
			return false
		}
	}*/
	
	def springSecurityService
	
    def index() { // page profil perso
		render view : 'index'
		//render view : '/home'
	}
	
	def login() {
		if(!session.user) {
			if(request.post){
				def user = User.findWhere(username:params['login'],password:params['password'])
				if(user && user.active==true){
					session.user = user
					flash.message = "Welcome back!"
					redirect(controller:'home',action:'index')
				}else{
					render view : 'signin'
				}
			}else{
				render view : 'signin'
			}
		}else{
			redirect(controller:'home',action:'index')
		}
	}
	
	def logout() {
		session.invalidate()
		redirect(controller:'home',action:'index')
		flash.success = "GoodBye!"
		render view : '/home'
	}

	def register() {
		if(!session.user) {
			if(request.post){
				def user = new User(email:params['email'],username:params['login'],password:params['password'],firstName:params['firstn'],lastName:params['lastn'],lastConnection:null,created:new Date(),modified:null,accountExpired:false,passwordExpired:false,accountLocked:false)
				if (user.save(flush: true)) {
					flash.success = "Thank you for signing up to our JetSet Magazine!"
					redirect(controller:'home',action:'index')
				}else{
					flash.warning = "An error was captured!"
					redirect(controller:'user',action:'register')
				}
			}else{		
				render view : 'signup'
			}
		}else{
			render view : '/home'
		}
	}
	
	//@Secured(['ROLE_ADMIN'])
	def list(params) {
		params.max = Math.min(params.max ? params.int('max') : 2, 100)
		params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
		[usersList: User.list(params), usersCount: User.count()]
	}

}
