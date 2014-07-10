package com.jetsetmag

import org.springframework.web.servlet.mvc.Controller;

class UserController {

	def beforeInterceptor = [action:this.&checkUser,except:['login','register']] // init function // 'list','show',

	def checkUser() {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
	}
	
    def index() {
		render view : 'index'
	}
	
	def login() {
		if(!session.user) {
			if(request.post){
				def user = User.findWhere(username:params['login'],secret:params['password'])
				session.user = user
				if(user && user.active)
					render view : 'index'
				else
					render view : 'signin'
			}else{
				render view : 'signin'
			}
		}else{
			render view : 'index'
		}
	}
	
	def logout() {
		if(session.user) {
			session.invalidate()
			redirect(controller:'home',action:'index')
		}
		render view : 'index'
	}

	def register() {
		if(!session.user) {
			if(request.post){
				def user = new User(email:params['email'],username:params['login'],secret:params['password'],firstName:params['firstn'],lastName:params['lastn'],lastConnection:new Date(),created:new Date(),modified:new Date(),status:0,active:0)
				if (user.save(flush: true)) {
					flash.success = "Votre compte est bien enregistré !"
					redirect(controller:'home',action:'index')
				}else{
					flash.warning = "Erreur lors de l'enregsitrement de votre compte !"
				}
			}else{		
				render view : 'signup'
			}
		}else{
			render view : 'index'
		}
	}

}
