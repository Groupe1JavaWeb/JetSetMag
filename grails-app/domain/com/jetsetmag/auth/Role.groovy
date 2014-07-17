package com.jetsetmag.auth

class Role {

   String authority

   static mapping = {
	  table 'j7m_roles'
      cache true
   }

   static constraints = {
      authority blank: false, unique: true
   }
}
