package com.jetsetmag

class User {
	Integer id
	String username
	String secret
	String email
	String firstName
	String lastName
	Date created
	Date modified
	Date lastConnection
	boolean active
	Integer status	
	static belongsTo = RoleUser	
    static constraints = {
		id generator: 'identity', column: 'id'
		username size: 5..15, blank: false, nullable: false, unique: true
		secret size: 5..15, blank: false, nullable: false, password:true
		firstName blank: false, nullable: false
		lastName blank: false, nullable: false
		email email: true, blank: false, unique: true
		status(inList:[0, 1, 2]) // 0 : deconnecté , 1 : connecté , 2 : occupé
    }
	static mapping = {
		table 'j7m_users'
	}
}
