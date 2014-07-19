package com.jetsetmag.hangout

import com.jetsetmag.auth.User
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class EventController {

	//static allowedMethods = [show: "GET", list: "GET"]
	
	private static final imageAutorized = ['image/png', 'image/jpeg', 'image/gif']
	
	@Secured(['permitAll'])
	def index() { 
		// get by max pagination , offset 
			//params.max = Math.min(params.max ? params.int('max') : 10, 100)
			//params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
			//render view: 'index', model : [eventsList: Event.list(params), eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
		// get all to masnory gallery
			render view: 'index', model : [commentsCount:Comment.count(),eventsList: Event.list(), eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true),usersCount:User.count()]
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def list() { // list All
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
		render view: 'list', model : [eventsList: Event.list(params), eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true),commentsCount:Comment.count(),usersCount:User.count(),FilterIsNews:null]
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def listN() { // list just the news ==> isNews=true
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
		render view: 'list', model : [eventsList: Event.list(params), eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true),commentsCount:Comment.count(),usersCount:User.count(),FilterIsNews:true]
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def listE() { // list just the events ==> isNews=false
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
		render view: 'list', model : [eventsList: Event.list(params), eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true),commentsCount:Comment.count(),usersCount:User.count(),FilterIsNews:false]
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def create() {
		if(request.post){
			if(params.enabled=="on"){params.enabled=true;}else{params.enabled=false;}
			if(params.isNews=="on"){params.isNews=true;}else{params.isNews=false;}
			// Get the cover file from the multi-part request
			def cover = request.getFile('cover')
			if(cover.bytes){
				// List of autorized  mime-types
				if (!imageAutorized.contains(cover.getContentType())) {
					flash.warning = "the event/news's cover must be one of those images types : ${imageAutorized}"
					render view:'add',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
					return
				}else{
					def event = new Event(title:params.title,description:params.description,enabled:params.enabled,cover:cover.bytes,coverType:cover.contentType,user:session.currentUser,isNews:params.isNews)
					if(event.save(flush:true)) { // flush:true
						flash.message = " A new event/news was added successfully !"
						redirect (controller:'Event',action:'list', model : [event:event,usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
					}else{
						flash.danger = " A error was detected !"
						render view : 'add', model : [event:event,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
						return
					}
				}
			}else{
			    def event = new Event(title:params.title,description:params.description,enabled:params.enabled,user:session.currentUser,isNews:params.isNews)
			    if(event.save(flush:true)) { // flush:true
					flash.message = " A new event/news was added successfully !"
					redirect (controller:'Event',action:'list', model : [event:event,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
			    }else{
					flash.danger = " A error was detected !"
					render view : 'add', model : [event:event,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
					return
			    }
			}
		}else{
			render view : 'add',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
		}
	}

	@Secured(['permitAll'])
	def cover() {
		def event = Event.findById(params.id)
		if ( !event || !event.cover || !event.coverType ) {
			response.sendError(404)
			return
		}
		response.contentType = event.coverType
		response.contentLength = event.cover.size()
		response.outputStream << event.cover  // this is a byte[]
		response.outputStream.flush()
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def delete() {
		def dangerMsg = ""
		def successMsg = ""
		def warningMsg = ""
		params.list('id').each {
			if(it){
				def eventinstance = Event.findById(it)
				if(eventinstance){
					//eventinstance.comments.clear() // sometimes some troubles !!!!
					// or
					eventinstance.comments.each { comment ->
						eventinstance.removeFromComments(comment)
						comment.delete(flush:true)
					}
					if(eventinstance.delete(flush:true)){ // flush:true ===> Row was updated or deleted by another transaction (or unsaved-value mapping was incorrect) : [com.jetsetmag.hangout.Event#1]
						successMsg << " The event/news , was successfully deleted !"
					}else{
						dangerMsg << " A error was detected when deleting this event/news !"
					}
				}else{
					warningMsg << " This event/news , was found !"
				}
			}
		}
		
		flash.danger=dangerMsg
		flash.success=successMsg
		flash.warning=warningMsg
		
		redirect(controller:'Event',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
	}
	
	@Secured(['permitAll'])
	def show() {
		def event = Event.findById(params.id)
		if(event){
			render view : 'show',model :[event:event,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
		}
		else{
			flash.danger = "No event/news was found to show !"
			redirect(controller:'Event',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
		}
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def edit() {		
		if(request.post){
			def event = Event.findById(params.id)
			if(params.enabled=="on"){params.enabled=true;}else{params.enabled=false;}
			if(params.isNews=="on"){params.isNews=true;}else{params.isNews=false;}
			// Get the cover file from the multi-part request
			def cover = request.getFile('cover')
			if(cover.bytes){
				// List of autorized  mime-types
				if (!imageAutorized.contains(cover.getContentType())) {
					flash.warning = "the event/news's cover must be one of those images types : ${imageAutorized}"
					render view:'edit', model : [event:event,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
					return
				}else{
					if(event){
						event.title=params.title
						event.description=params.description
						event.enabled=params.enabled
						event.isNews=params.isNews
						def startDate = new Date().parse( "yyyy/M/dd",params.startDate.toString())
						def endDate = new Date().parse( "yyyy/M/dd",params.endDate.toString())
						event.startDate=startDate
						event.endDate=endDate
						event.cover=cover.bytes
						event.coverType=cover.contentType
						if(event.save(flush:true)){ // flush:true
							flash.message = " The event/news was successfully updated !"
							redirect(controller:'Event',action:'show',model : [ id : params.id , commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)] )
						}else{
							flash.danger = "Unable to update this event/news !"
							redirect(controller:'Event',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
						}
					}else{
						flash.danger = "No event/news was found to update !"
						redirect(controller:'Event',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
					}
				}
			}else{			
				if(event){
					event.title=params.title
					event.description=params.description
					event.enabled=params.enabled
					event.isNews=params.isNews
					def startDate = new Date().parse( "yyyy/M/dd",params.startDate.toString())
					def endDate = new Date().parse( "yyyy/M/dd",params.endDate.toString())
					event.startDate=startDate
					event.endDate=endDate
					if(event.save(flush:true)){ // flush:true
						flash.message = " The event/news was successfully updated !"
						redirect(controller:'Event',action:'show',model : [ id : params.id , commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)] )
					}else{
						flash.danger = "Unable to update this event/news !"
						redirect(controller:'Event',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
					}
				}else{
					flash.danger = "No event/news was found to update !"
					redirect(controller:'Event',action:'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)])
				}
			}
		}else{
			def event = Event.findById(params.id)
			if(event){
				render view : 'edit',model :[event:event,commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)]
			}
			else{
				flash.danger = "No event/news was found to show !"
				redirect(controller:'Event',action:'list',commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true))
			}
		}
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def started() { // via Ajax Post call
		if(request.post){
			def eventTo = Event.findById(params.which)
			if(eventTo){				
				eventTo.enabled = !eventTo.enabled
				if(eventTo.save(flush:true)){
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

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def taggedAs() { // via Ajax Post call
		if(request.post){
			def eventTo = Event.findById(params.which)
			if(eventTo){
				eventTo.isNews = !eventTo.isNews
				if(eventTo.save(flush:true)){
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

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def canComment() { // via Ajax Post call
		if(request.post){
			def eventTo = Event.findById(params.which)
			if(eventTo){
				eventTo.canComment = !eventTo.canComment
				if(eventTo.save(flush:true)){
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

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def showComments() { // via Ajax Post call
		if(request.post){
			def eventTo = Event.findById(params.which)
			if(eventTo){
				eventTo.showComments = !eventTo.showComments
				if(eventTo.save(flush:true)){
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
		def resE
		if(request.post){
			
			////////// Users Search
			resE = Event.search("${params.searchField}")
			if(resE.total>0){
				infoMsg <<  "Found ${res.total} result(s) in event/news !"
				resE.searchResults.each {
					if(it instanceof Event) {
						successMsg << " A event/news { "+it.title+" } was found !"
					} else {
						dangerMsg << " This event/news { "+it.title+" } was found and protected !"
					}
				}
			}else{
				warningMsg << "No event/news found !"
			}
			
		}
		
		flash.info=infoMsg
		flash.danger=dangerMsg
		flash.success=successMsg
		flash.warning=warningMsg
		
		render view : 'list',model : [commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true),resE:resE]

	}

}
