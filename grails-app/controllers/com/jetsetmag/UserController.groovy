package com.jetsetmag

import org.springframework.web.servlet.mvc.Controller;

class UserController {

	def beforeInterceptor = [action:this.&checkUser,except:['login','register']] // init function // 'list','show',

	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			//redirect(controller:'home',action:'index')
			//redirect(controller:'user',action:'index')
			return false
		}
	}
	
    def index() { // page profil perso
		render view : 'index'
		//render view : '/home'
	}
	
	def login() {
		if(!session.user) {
			if(request.post){
				def user = User.findWhere(username:params['login'],secret:params['password'])
				//if(user.is(User) && user.active==1){
				if(user && user.active){
					session.user = user
					flash.message = "Welcome back !"
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
		flash.success = "A très bientôt !"
		render view : '/home'
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
					redirect(controller:'user',action:'register')
				}
			}else{		
				render view : 'signup'
			}
		}else{
			render view : '/home'
		}
	}

}
