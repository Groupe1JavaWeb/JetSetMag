package com.jetsetmag.admin

import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED']) // @Secured(['IS_AUTHENTICATED']) ==> with remember_me ON
class UserController {
	
    @Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def index() {
		render view : 'index'
	}
	
	@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
	def list() {
		render view : 'list'	
	}
	
}
