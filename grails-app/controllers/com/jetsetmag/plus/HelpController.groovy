package com.jetsetmag.plus

import com.jetsetmag.auth.User
import com.jetsetmag.hangout.Event
import com.jetsetmag.hangout.Comment

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class HelpController {
	
	@Secured(['permitAll'])
	def index() {
		render view : 'index',model : [ commentsCount:Comment.count(),usersCount:User.count(),eventsCount:Event.countByisNews(false),newsCount:Event.countByisNews(true)] 
	}

}
