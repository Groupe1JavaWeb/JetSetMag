package com.jetsetmag.admin

import com.jetsetmag.auth.User
import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED']) // @Secured(['IS_AUTHENTICATED']) ==> with remember_me ON
class UserController {
	
    @Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def index() {
		render view : 'index'
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def list() {
		params.max = Math.min(params.max ? params.int('max') : 5, 100)
		params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
		render view: 'list', model : [usersList: User.list(params), usersCount: User.count()]
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def search() {
		if(request.post){ // .get
			def res = User.search("${params.searchField}") // calling elasticsearch
			//if(res.total>0){
				println "Found ${res.total} result(s)"
				res.searchResults.each {
					if(it instanceof User) {
						println it.firstName
					} else {
						println it.toString()
					}
				}
			//}else{
			//	println "No user found !"
			//	//flash.error = "No user found !"
			//}
		}
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def show() {
		if(request.post){
			render view : 'show'
		}else{
			flash.error = "No user selected !"
			redirect(controller:'User',action:'list')
		}
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def edit() {
		if(request.post){
			render view : 'edit'
		}else{
			flash.error = "No user selected !"
			redirect(controller:'User',action:'list')
		}
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def delete() {
		if(request.post){
			redirect(controller:'User',action:'list')
		}else{
			flash.error = "No user selected !"
			redirect(controller:'User',action:'list')
		}
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def changeState() { // via Ajax Post call
		if(request.post){
			def userTo = User.findById(params.who)
			if(userTo){				
				userTo.enabled = !userTo.enabled
				if(userTo.save(flush:true)){
					return true
				}else{
					return false
				}
			}else{
				return false	
			}
		}else{
			return false
		}
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def create() {
		if(request.post){
		    /*def userInstance = new User(params)
		    if (!userInstance.save(flush: true)) {
		        render(view: "create", model: [userInstance: userInstance])
		        return
		    }
		
		    if (!userInstance.authorities.contains(Role.findByAuthority(params.role))) {
		        UserRole.create userInstance, Role.findByAuthority(params.role)
		    }else{
		    	UserRole.create userInstance, Role.findByAuthority("ROLE_USER")
		    }
		
		    flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
		    redirect(action: "show", id: userInstance.id)*/
			redirect(action: "list")
		}else{
			render view : 'create'
		}
		render view : 'index'
	}

}
