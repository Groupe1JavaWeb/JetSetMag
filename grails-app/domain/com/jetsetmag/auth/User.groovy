package com.jetsetmag.auth

import org.springframework.context.annotation.Role

class User {
	static searchable = true
	transient springSecurityService
	
	Integer id
	String username
	String secret // password
	String email
	String firstName
	String lastName
	Date created
	Date modified
	Date lastConnection
	boolean active = true
	boolean accountExpired
	boolean accountLocked
	boolean secretExpired
	Integer status
	
	static transients = ['springSecurityService']
	
    static constraints = {
		id generator: 'identity', column: 'id'
		username size: 5..15, blank: false, nullable: false, unique: true
		secret size: 5..15, blank: false, nullable: false, password:true
		firstName blank: false, nullable: false
		lastName blank: false, nullable: false
		email email: true, blank: false, unique: true
		status(inList:[0, 1, 2]) // 0 : deconnecté , 1 : connecté , 2 : occupé
    }

	Set<Role> getAuthorities() { // The getAuthorities() method is analagous to defining static hasMany = [authorities: Authority]
		UserRole.findAllByUser(this).collect { it.role }
	}
  
	def beforeInsert() {
		encodeSecret()
	}
  
	def beforeUpdate() {
		 if (isDirty('secret')) {
			 encodeSecret()
		 }
	}
  
	protected void encodeSecret() {
		secret = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(secret) : secret
	}
	 
	static mapping = {
		table 'j7m_users'
	}

}
