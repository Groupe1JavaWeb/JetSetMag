class UrlMappings {
	static mappings = {
		// Rest Api ( Swing ) : Part II ===> ReadOnly // [GET:"show", POST:"save", PUT:"update", DELETE:"remove"]
			"/JetSetMagRest"{
				action = [GET:"list"]
			}
			// Show Details via a reference :  Id
				"/JetSetMagRest/$id?(.$format)?"{
					action = [GET:"show"]
				}
		// Default Routes
			"/$controller/$action?/$id?(.$format)?"{
				constraints {
					// apply constraints here
				}
			}		
			"/" ( controller:'Home', action:'index' )		
		// Custom Alias
			"/index" 	( controller:'Home', action:'index' )
			"/home"  	( controller:'Home', action:'index' )
			"/download" ( controller:'Home', action:'downloadApp' )
			"/login" 	( controller:'Home', action:'login' )
			"/register" ( controller:'Home', action:'register' )
			"/logout" 	( controller:'Home', action:'logout' )
		// Custom Errors
			// All
				"/error"  (controller: "Error", action: "index")
				"/denied" (controller: "Error", action: "denied")
			// Http
				"400" (controller: "Error", action: "error400",code:400)
				"401" (controller: "Error", action: "error401",code:401)
				"402" (controller: "Error", action: "error402",code:402)
				"403" (controller: "Error", action: "error403",code:403)
				"404" (controller: "Error", action: "error404",code:404)
				"405" (controller: "Error", action: "error405",code:405)
				"500" (controller: "Error", action: "error500",code:500)
				"501" (controller: "Error", action: "error501",code:501)
				"502" (controller: "Error", action: "error502",code:502)
				"503" (controller: "Error", action: "error503",code:503)
	}	
}
