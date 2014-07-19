package com.jetsetmag.admin

import com.jetsetmag.auth.User
import com.jetsetmag.auth.UserRole
import grails.plugin.springsecurity.annotation.Secured
import com.jetsetmag.hangout.Event
import com.jetsetmag.hangout.Comment

@Secured(['permitAll']) // @Secured(['IS_AUTHENTICATED_FULLY']) ==> with remember_me ON
class UserController {
	
    @Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def index() {
		render view : 'index',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
		render view: 'list', model : [usersList: User.list(params), usersCount: User.count(),commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def search() {

		def infoMsg = ""
		def dangerMsg = ""
		def successMsg = ""
		def warningMsg = ""
		def resU
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
			
		}
		
		flash.info=infoMsg
		flash.danger=dangerMsg
		flash.success=successMsg
		flash.warning=warningMsg
		
		render view : 'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true),resU:resU]
		
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN']) // Normallement ya que le user lui même qui peut modifier ses propres détails ;) ===> 'IS_AUTHENTICATED'
	def show() {
		def user = User.findById(params.id)
		if(user){
			render view : 'show',model :[user:user,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
		}
		else{
			flash.danger = "No user was found to show !"
			redirect(controller:'User',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
		}
	}

	@Secured(['permitAll'])
	def showme() {
		def user = User.findById(session.currentUser.id)
		if(user){
			render view : 'show',model :[user:user,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
		}
		else{
			flash.danger = "Your profile was not found to show it!"
			redirect(controller:'Home',action:'index',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
		}
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN']) // Normallement ya que le user lui même qui peut modifier ses propres détails ;) ===> 'IS_AUTHENTICATED'
	def edit() {
		if(request.post){
			if(params.enabled=="on"){params.enabled=true;}else{params.enabled=false;}
			if(params.accountExpired=="on"){params.accountExpired=true;}else{params.accountExpired=false;}
			if(params.passwordExpired=="on"){params.passwordExpired=true;}else{params.passwordExpired=false;}
			if(params.accountLocked=="on"){params.accountLocked=true;}else{params.accountLocked=false;}
			def user = User.findById(params.id) // session.currentUser.id
			if(user){
				user.firstName=params.firstName
				user.lastName=params.lastName
				user.enabled=params.enabled
				user.email=params.email
				user.accountExpired=params.accountExpired
				user.passwordExpired=params.passwordExpired
				user.accountLocked=params.accountLocked
				if(user.save(flush:true)){ // flush:true
					flash.message = " The user was successfully updated !"
					redirect(controller:'User',action:'show',model : [id : params.id, commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)] )
				}else{
					flash.danger = "Unable to update this user !"
					redirect(controller:'User',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
				}
			}else{
				flash.danger = "No user was found to update !"
				redirect(controller:'User',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
			}
		}else{
			def user = user.findById(params.id) // session.currentUser.id
			if(user){
				render view : 'edit',model :[user:user,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
			}
			else{
				flash.danger = "No user was found to show !"
				redirect(controller:'User',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
			}
		}
	}

	@Secured(['permitAll'])
	def editme() {
		def user = user.findById(session.currentUser.id) // session.currentUser.id
		if(user){
			render view : 'edit',model :[user:user,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
		}
		else{
			flash.danger = "Your profile was not found to show it!"
			redirect(controller:'Home',action:'index',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
		}
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def delete() {
		def dangerMsg = ""
		def successMsg = ""
		def warningMsg = ""
		params.list('id').each {
			if(it){
				def userInstance = User.findById(it)
				if(userInstance){
					Collection<UserRole> userRoles = UserRole.findAllByUser(userInstance);
					if(userRoles*.delete()){ // * => each
						successMsg << " The user relatifs roles , was successfully deleted !"
						if(userInstance.delete(flush:true)){ // flush:true ===> Row was updated or deleted by another transaction (or unsaved-value mapping was incorrect) : [com.jetsetmag.hangout.Event#1]
							successMsg << " The user , was successfully deleted !"
						}else{
							//System.out.println("nok deleted")
							dangerMsg << " A error was detected when deleting this user !"
						}
					}else{
						successMsg << " An error was detected when deleting the user's relatifs roles !"
					}
				}else{
					//System.out.println("ok not found")
					warningMsg << " This user , was found !"
				}
			}
		}
		
		flash.danger=dangerMsg
		flash.success=successMsg
		flash.warning=warningMsg
		
		redirect(controller:'User',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
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
	def changeAccountLockedState() { // via Ajax Post call
		if(request.post){
			def userTo = User.findById(params.who)
			if(userTo){
				userTo.accountLocked = !userTo.accountLocked
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
	def changeAccountExpiredState() { // via Ajax Post call
		if(request.post){
			def userTo = User.findById(params.who)
			if(userTo){
				userTo.accountExpired = !userTo.accountExpired
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
	def changePasswordExpiredState() { // via Ajax Post call
		if(request.post){
			def userTo = User.findById(params.who)
			if(userTo){
				userTo.passwordExpired = !userTo.passwordExpired
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
			redirect(action: "list",model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
		}else{
			render view : 'create',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
		}
		render view : 'index',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
	}

}
