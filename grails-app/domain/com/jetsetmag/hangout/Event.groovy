package com.jetsetmag.hangout

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
	String cover
	
    static constraints = {
		title			blank: false, nullable: false
		description 	blank: false, nullable: false
		startDate		blank: false, nullable: false
		endDate 		blank: false, nullable: false
		cover 			nullable: true, blank: true
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
		//cover type: 'image'
	}
	
}
