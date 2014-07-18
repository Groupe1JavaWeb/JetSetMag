package com.jetsetmag.hangout

import com.jetsetmag.auth.User
import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED'])
class EventController {

	//static allowedMethods = [show: "GET", list: "GET"]
	
	private static final imageAutorized = ['image/png', 'image/jpeg', 'image/gif']
	
	@Secured(['permitAll'])
	def index() { 
		// get by max pagination , offset 
			//params.max = Math.min(params.max ? params.int('max') : 10, 100)
			//params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
			//render view: 'index', model : [eventsList: Event.list(params), eventsCount: Event.count()]
		// get all to masnory gallery
			render view: 'index', model : [eventsList: Event.list(), eventsCount: Event.count(),usersCount:User.count()]
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
		render view: 'list', model : [eventsList: Event.list(params), eventsCount: Event.count(),usersCount:User.count()]
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def create() {
		if(request.post){
			if(params.enabled=="on"){params.enabled=true;}else{params.enabled=false;}
			// Get the cover file from the multi-part request
			def cover = request.getFile('cover')
			if(cover.bytes){
				// List of autorized  mime-types
				if (!imageAutorized.contains(cover.getContentType())) {
					flash.warning = "the event's cover must be one of those images types : ${imageAutorized}"
					render view:'add',model : [usersCount:User.count(),eventsCount:Event.count()]
					return
				}else{
					def event = new Event(title:params.title,description:params.description,enabled:params.enabled,cover:cover.bytes,coverType:cover.contentType,user:session.currentUser)
					if(event.save(flush:true)) { // flush:true
						flash.message = " A new event was added successfully !"
						redirect (controller:'Event',action:'list', model : [event:event,usersCount:User.count(),eventsCount:Event.count()])
					}else{
						flash.danger = " A error was detected !"
						render view : 'add', model : [event:event,usersCount:User.count(),eventsCount:Event.count()]
						return
					}
				}
			}else{
			    def event = new Event(title:params.title,description:params.description,enabled:params.enabled,user:session.currentUser)
			    if(event.save(flush:true)) { // flush:true
					flash.message = " A new event was added successfully !"
					redirect (controller:'Event',action:'list', model : [event:event,usersCount:User.count(),eventsCount:Event.count()])
			    }else{
					flash.danger = " A error was detected !"
					render view : 'add', model : [event:event,usersCount:User.count(),eventsCount:Event.count()]
					return
			    }
			}
		}else{
			render view : 'add',model : [usersCount:User.count(),eventsCount:Event.count()]
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
				//System.out.println("EVENT : "+it)
				def eventinstance = Event.findById(it)
				if(eventinstance){
					//System.out.println("ok found")
					if(eventinstance.delete(flush:true)){ // flush:true ===> Row was updated or deleted by another transaction (or unsaved-value mapping was incorrect) : [com.jetsetmag.hangout.Event#1]
						//System.out.println("ok deleted")
						successMsg << " The event , was successfully deleted !"
					}else{
						//System.out.println("nok deleted")
						dangerMsg << " A error was detected when deleting this event !"
					}
				}else{
					//System.out.println("ok not found")
					warningMsg << " This event , was found !"
				}
			}
		}
		
		flash.danger=dangerMsg
		flash.success=successMsg
		flash.warning=warningMsg
		
		redirect(controller:'Event',action:'list',model : [usersCount:User.count(),eventsCount:Event.count()])
	}
	
	@Secured(['permitAll'])
	def show() {
		def event = Event.findById(params.id)
		if(event){
			render view : 'show',model :[event:event,usersCount:User.count(),eventsCount:Event.count()]
		}
		else{
			flash.danger = "No event was found to show !"
			redirect(controller:'Event',action:'list',model : [usersCount:User.count(),eventsCount:Event.count()])
		}
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def edit() {		
		if(request.post){
			def event = Event.findById(params.id)
			if(params.enabled=="on"){params.enabled=true;}else{params.enabled=false;}
			// Get the cover file from the multi-part request
			def cover = request.getFile('cover')
			if(cover.bytes){
				// List of autorized  mime-types
				if (!imageAutorized.contains(cover.getContentType())) {
					flash.warning = "the event's cover must be one of those images types : ${imageAutorized}"
					render view:'edit', model : [event:event,usersCount:User.count(),eventsCount:Event.count()]
					return
				}else{
					if(event){
						event.title=params.title
						event.description=params.description
						event.enabled=params.enabled
						def startDate = new Date().parse( "yyyy/M/dd",params.startDate.toString())
						def endDate = new Date().parse( "yyyy/M/dd",params.endDate.toString())
						event.startDate=startDate
						event.endDate=endDate
						event.cover=cover.bytes
						event.coverType=cover.contentType
						if(event.save(flush:true)){ // flush:true
							flash.message = " The event was successfully updated !"
							redirect(controller:'Event',action:'show',model : [ id : params.id , usersCount:User.count(),eventsCount:Event.count()] )
						}else{
							flash.danger = "Unable to update this event !"
							redirect(controller:'Event',action:'list',model : [usersCount:User.count(),eventsCount:Event.count()])
						}
					}else{
						flash.danger = "No event was found to update !"
						redirect(controller:'Event',action:'list',model : [usersCount:User.count(),eventsCount:Event.count()])
					}
				}
			}else{			
				if(event){
					event.title=params.title
					event.description=params.description
					event.enabled=params.enabled
					def startDate = new Date().parse( "yyyy/M/dd",params.startDate.toString())
					def endDate = new Date().parse( "yyyy/M/dd",params.endDate.toString())
					event.startDate=startDate
					event.endDate=endDate
					if(event.save(flush:true)){ // flush:true
						flash.message = " The event was successfully updated !"
						redirect(controller:'Event',action:'show',model : [ id : params.id , usersCount:User.count(),eventsCount:Event.count()] )
					}else{
						flash.danger = "Unable to update this event !"
						redirect(controller:'Event',action:'list',model : [usersCount:User.count(),eventsCount:Event.count()])
					}
				}else{
					flash.danger = "No event was found to update !"
					redirect(controller:'Event',action:'list',model : [usersCount:User.count(),eventsCount:Event.count()])
				}
			}
		}else{
			def event = Event.findById(params.id)
			if(event){
				render view : 'edit',model :[event:event,usersCount:User.count(),eventsCount:Event.count()]
			}
			else{
				flash.danger = "No event was found to show !"
				redirect(controller:'Event',action:'list',usersCount:User.count(),eventsCount:Event.count())
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
		
		render view : 'list',model : [usersCount:User.count(),eventsCount:Event.count(),resE:resE]

	}

}
