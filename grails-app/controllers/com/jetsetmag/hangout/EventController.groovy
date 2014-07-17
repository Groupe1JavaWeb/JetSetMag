package com.jetsetmag.hangout

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class EventController {

	//static allowedMethods = [show: "GET", list: "GET"]
	
	def index() { 
		render view : 'index'	
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def list() {
		params.max = Math.min(params.max ? params.int('max') : 5, 100)
		params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
		render view: 'list', model : [eventsList: Event.list(params), eventsCount: Event.count()]
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def create() {
		if(request.post){
			if(params.enabled=="on"){params.enabled=true;}else{params.enabled=false;}
		    def event = new Event(title:params.title,description:params.description,enabled:params.enabled)
		    if(event.save(flush: true)) {
				flash.message = " A new event was added successfully !"
				redirect(controller:'Event',action:'list', model : [event:event])
		    }else{
				flash.error = " A error was detected !"
				render view : 'add', model : [event:event]
		    }
			render view: 'list', model : [event:event]
		}else{
			render view : 'add'
		}
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def delete() {
		if(request.post){
			if(Event.deleteAll(params.id)){
				flash.message = " The event was deleted successfully !"
			}else{
				flash.error = " A error was detected !"
			}			
			redirect(controller:'Event',action:'list')
		}else{
			flash.error = "No event selected !"
			redirect(controller:'Event',action:'list')
		}
	}
	
	@Secured(['permitAll'])
	def show() {
		def event = Event.findById(params.id)
		if(event){
			render view : 'show',model :[event:event]
		}
		else{
			flash.error = "No event found !"
			redirect(controller:'Event',action:'list')
		}
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def edit() {		
		if(request.post){
			if(request.method == 'GET'){
				def event = Event.get(params.id)
				if(event){					
					render view : 'edit',model :[event:event]
				}
				else{
					flash.error = "No event found !"
					redirect(controller:'Event',action:'list')
				}
			}else{			
				if(params.enabled=="on"){params.enabled=true;}else{params.enabled=false;}
				if(Event.save(id:params.id,title:params.title,description:params.description,enabled:params.enabled)){
					redirect(controller:'Event',action:'edit',model:[event:event])
				}
			}
		}else{
			flash.error = "No event selected !"
			redirect(controller:'Event',action:'list')
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
	
}
