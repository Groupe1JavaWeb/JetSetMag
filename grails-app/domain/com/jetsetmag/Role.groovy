package com.jetsetmag

class Role {
	
	Integer id
	String role
	String description
	boolean active
	Integer parent
	static belongsTo = RoleUser
    static constraints = {
		id generator: 'identity', column: 'id'
		role nullable: false, unique: true
		description nullable:true
		parent nullable: true
    }
	static mapping = {
		table 'j7m_roles'
	}
	
}
