package com.jetsetmag.hangout

import java.awt.TexturePaintContext.Byte;

import com.mysql.jdbc.Blob;

class Event {

	static searchable = true
	
	//static scaffold = true 
	
	String title
	Date endDate = new Date()
	Date startDate = new Date()
	String description
	Date created = new Date()
	Date modified = new Date()
	boolean enabled = true
	boolean canInvite = false
	boolean restricted = false
	String cover
	String coverType

	
    static constraints = {
		title			blank: false, nullable: false
		description 	blank: false, nullable: false
		startDate		blank: false, nullable: false
		endDate 		blank: false, nullable: false
		cover			nullable:true, maxSize: 10485760  /* 83886080 b , 10240 Ko , 10 M */
		coverType		nullable:true	
    }
	
	def beforeInsert() {
		created = new Date()
	}
  
	def beforeUpdate() {
		modified = new Date()
	}
	 
	static mapping = {
		table 'j7m_events'
		description type: 'text'
		title type: 'text'
		sqlType : 'longblob' // ok
		//cover type: 'image', sqlType : 'longblob' // OK
		//cover type: 'image' // ok ===> medimumblob
	}
	
}
