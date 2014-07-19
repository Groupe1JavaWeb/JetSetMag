package com.jetsetmag.hangout

import com.jetsetmag.auth.User;

class Comment {

	static searchable = true
	
	String description
	Date created = new Date()
	Date modified = new Date()
	boolean enabled = true
	
	static belongsTo = [user:User,event:Event,master:Comment] // an event can be a simple news entry with the IsNews = true ;)  /// master it means that this coment is a response to a master comment below
	static hasMany = [responses:Comment]
	
    static constraints = {
		description 	blank: false, nullable: false
		master			nullable:true
    }
	
	def beforeInsert() {
		created = new Date()
	}
  
	def beforeUpdate() {
		modified = new Date()
	}
	 
	static mapping = {
		table 'j7m_comments'
		description type: 'text'
		responses cascade:'all-delete-orphan'
		responses lazy: false
		user lazy: false
		event lazy: false
	}

}
