package com.jetsetmag.hangout

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class EventController {

    def index() { 
		render view : 'list'	
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
		    /*def eventInstance = new Event(params)
		    if (!eventInstance.save(flush: true)) {
		        render(view: "create", model: [eventInstance: eventInstance])
		        return
		    }
		
		    flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])
		    redirect(action: "show", id: eventInstance.id)*/
			redirect(action: "list")
		}else{
			render view : 'add'
		}
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def delete() {
		if(request.post){
			redirect(controller:'Event',action:'list')
		}else{
			flash.error = "No event selected !"
			redirect(controller:'Event',action:'list')
		}
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def show() {
		if(request.post){
			redirect(controller:'Event',action:'list')
		}else{
			flash.error = "No event selected !"
			redirect(controller:'Event',action:'list')
		}
	}

	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_MEMBER'])
	def edit() {
		if(request.post){
			redirect(controller:'Event',action:'list')
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
