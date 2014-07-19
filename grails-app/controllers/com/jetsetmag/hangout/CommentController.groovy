package com.jetsetmag.hangout

import com.jetsetmag.auth.User
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class CommentController { // must be builde on AjaxCalls

	@Secured(['permitAll'])
	def index() {
		render view: 'index', model : [commentsCount:Comment.count(),eventsCount: Event.count(),usersCount:User.count()]
	}
	
	@Secured(['permitAll'])
	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
		render view: 'list', model : [commentsList: Comment.list(params),commentsCount:Comment.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true),usersCount:User.count()]
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def delete() {
			def dangerMsg = ""
			def successMsg = ""
			def warningMsg = ""
			params.list('id').each {
				if(it){
					//Comment.findById(it).delete()
					def commentInstance = Comment.findById(it)
					if(commentInstance){
						//session.currentUser.comments.remove(commentInstance) // detach from user // lazyException
						//Event.findById(commentInstance.event.id).comments.remove(commentInstance) // detach from event // lazyException
						User.findById(commentInstance.user.id).removeFromComments(commentInstance) // OK
						if(commentInstance.delete(flush:true)){ // then delete it
							successMsg << " The comment , was successfully deleted !"
						}else{
							dangerMsg << " A error was detected when deleting this comment !"
						}
					}else{
						warningMsg << " This comment , was not found !"
					}
				}
			}	
			flash.danger=dangerMsg
			flash.success=successMsg
			flash.warning=warningMsg		
			redirect(controller:'event',action:'show',id:params.event,model : [id:params.event,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
	}
		
	@Secured(['permitAll'])
	def create() {
		if(request.post){
			def event = Event.findById(params.event)
			if(event){
				if(params.enabled=="on"){params.enabled=true;}else{params.enabled=false;}
				def comment = new Comment(description:params.description,user:session.currentUser,event:event)
				if(comment.save()) { // flush:true
					flash.message = " A new comment was added successfully !"
					redirect (controller:'event',action:'show',id:params.event, model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
				}else{
					flash.danger = " A error was detected !"
					redirect (controller:'event',action:'show',id:params.event, model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
				}
			}else{
					flash.danger = " No event/news detected !"
					redirect (controller:'event',action:'show',id:params.event, model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
			}
		}else{
			redirect (controller:'Home',action:'index', model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]) // id:event.id,event:event,
		}
	}

	@Secured(['permitAll'])
	def deleteMines() {
			def dangerMsg = ""
			def successMsg = ""
			def warningMsg = ""
			params.list('id').each {
				if(it){
					//Comment.findById(it).delete()
					def commentInstance = Comment.findById(it)
					if(commentInstance){
						if(commentInstance.user.id==session.currentUser.id){
							//session.currentUser.comments.remove(commentInstance) // detach from user // lazyException
							//Event.findById(commentInstance.event.id).comments.remove(commentInstance) // detach from event // lazyException
							User.findById(commentInstance.user.id).removeFromComments(commentInstance) // OK
							if(commentInstance.delete(flush:true)){ // then delete it
								successMsg << " The comment , was successfully deleted !"
							}else{
								dangerMsg << " A error was detected when deleting this comment !"
							}
						}else{
							dangerMsg << " You can not delete a comment, if it's not yours !"
						}
					}else{
						warningMsg << " This comment , was not found !"
					}
				}
			}
			flash.danger=dangerMsg
			flash.success=successMsg
			flash.warning=warningMsg		
			redirect(controller:'event',action:'show',id:params.event,model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])		
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def changeState() { // via Ajax Post call
		if(request.post){
			def commentTo = Comment.findById(params.which)
			if(commentTo){
				commentTo.enabled = !commentTo.enabled
				if(commentTo.save(flush:true)){
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

	@Secured(['permitAll'])
	def search() {

		def infoMsg = ""
		def dangerMsg = ""
		def successMsg = ""
		def warningMsg = ""
		def resC
		if(request.post){
			
			////////// Users Search
			resC = Comment.search("${params.searchField}")
			if(resC.total>0){
				infoMsg <<  "Found ${res.total} result(s) in comment !"
				resC.searchResults.each {
					if(it instanceof Comment) {
						successMsg << " A comment { "+it.description+" } was found !"
					} else {
						dangerMsg << " This comment { "+it.description+" } was found and protected !"
					}
				}
			}else{
				warningMsg << "No comment found !"
			}
			
		}
		
		flash.info=infoMsg
		flash.danger=dangerMsg
		flash.success=successMsg
		flash.warning=warningMsg
		
		render view : 'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true),resC:resC]

	}
}
