package com.jetsetmag.auth

import com.jetsetmag.hangout.Event

class User {
	
	static searchable = true
	//static scaffold = true
	
	transient springSecurityService
	
	String username
	String password // secret
	String email
	String firstName
	String lastName
	Date created = new Date()
	Date modified = new Date()
	Date lastConnection = new Date()
	boolean enabled = false
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false	
	
	static transients = ['springSecurityService']
	static hasMany = [ events: Event]
	
    static constraints = {
		username	size: 5..15, blank: false, nullable: false, unique: true
		password	blank: false, nullable: false, password:true
		firstName	blank: false, nullable: false
		lastName	blank: false, nullable: false
		email		email: true, blank: false, unique: true
    }

	Set<Role> getAuthorities() { // The getAuthorities() method is analagous to defining static hasMany = [authorities: Authority]
		UserRole.findAllByUser(this).collect { it.role }
	}
  
	def beforeInsert() {
		created = new Date()
		encodePassword()
	}
  
	def beforeUpdate() {
		modified = new Date()
		if (isDirty('password')) {
			encodePassword()
		}
	}
  
	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
		//password = springSecurityService.encodePassword(password)
	}
	 
	static mapping = {
		table 'j7m_users'
		password column: '`password`'
		//events cascade:'all-delete-orphan'
	}

}
