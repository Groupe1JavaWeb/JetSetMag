package com.jetsetmag.hangout

class Event {

	static searchable = true
	
	//static scaffold = true 
	
	String title
	Date endDate
	Date startDate
	String description
	Date created
	Date modified
	boolean enabled = true
	boolean canInvite = false
	String cover
	
    static constraints = {
		title blank:false,nullable:false,size:5..100
		description blank:false,nullable:false
		startDate blank:false,nullable:false
		endDate blank:false,nullable:false
    }
	
	def beforeInsert() {
		created = new Date()
	}
  
	def beforeUpdate() {
		modified = new Date()
	}
	 
	static mapping = {
		table 'j7m_events'
	}
	
}
