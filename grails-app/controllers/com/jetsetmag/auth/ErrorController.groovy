package com.jetsetmag.auth

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permiAll'])
class ErrorController {

    def index() { render view : 'error' }
	
	def error401 = {
		render view : 'error401'
	}
	
	def error402 = {
		render view : 'error4021'
	}
	
	def error403 = {
		render view : 'error403'
	}
	
	def error404 = {
		render view : 'error404'
	}
	
	def error405 = {
		render view : 'error405'
	}
	
	def error500 = {
		render view : 'error500'
	}
	
	def error501 = {
		render view : 'error501'
	}
	
	def error502 = {
		render view : 'error502'
	}
	
	def error503 = {
		render view : 'error503'
	}

}
