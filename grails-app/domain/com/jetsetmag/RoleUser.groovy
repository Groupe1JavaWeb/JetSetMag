package com.jetsetmag

class RoleUser {
	Integer id
	Integer uid
	Integer rid
	static hasMany = [uid: User,rid: Role]	
    static constraints = {
		id generator: 'identity', column: 'id'
		uid nullable: true,unique:true
		rid nullable: true
    }
	static mapping = {
		table 'j7m_roles_users'
	}
}
