package com.jetsetmag.auth

class User {
	
	static searchable = true
	
	////transient springSecurityService
	def springSecurityService
	static transients = ['springSecurityService']
	
	Integer id
	String username
	String password // secret
	String email
	String firstName
	String lastName
	Date created = new Date()
	Date modified = new Date()
	Date lastConnection = new Date()
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
	
    static constraints = {
		id generator: 'identity', column: 'id'
		username size: 5..15, blank: false, nullable: false, unique: true
		password size: 5..15, blank: false, nullable: false, password:true
		firstName blank: false, nullable: false
		lastName blank: false, nullable: false
		email email: true, blank: false, unique: true
    }

	Set<Role> getAuthorities() { // The getAuthorities() method is analagous to defining static hasMany = [authorities: Authority]
		//UserRole.findAllByUser(this).collect { it.role }
		UserRole.findAllByUser(this).collect { it.role } as Set
	}
  
	/*def beforeInsert() {
		encodePassword()
	}
  
	def beforeUpdate() {
		 if (isDirty('password')) {
			 encodePassword()
		 }
	}*/
  
	protected void encodePassword() {
		//password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
		//password = springSecurityService.encodePassword(password)
	}
	 
	static mapping = {
		table 'j7m_users'
		password column: '`password`'
	}

}
