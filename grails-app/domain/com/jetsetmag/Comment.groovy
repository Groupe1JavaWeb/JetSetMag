package com.jetsetmag

class Comment {
	static searchable = true
	String user
	String title
	String content
	

    static constraints = {
		user  blank:false,nullable:false,size:5..10
		title blank:false,nullable:false
		content  blank:false,nullable:false,size:5..100
		
    }
	static mapping = {
		table 'j7m_comment'
	}
	
	
}
