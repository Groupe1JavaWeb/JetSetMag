package com.jetsetmag.hangout

class Evenement {

	static searchable = true
	
	static scaffold = true 
	
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
    }
}
