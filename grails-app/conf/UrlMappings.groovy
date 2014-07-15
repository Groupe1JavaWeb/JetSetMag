class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?(.$format)?"{
			constraints {
				// apply constraints here
			}
		}
		
		"/" ( controller:'Home', action:'index' )
		
		// Custom Alias
			"/index" ( controller:'Home', action:'index' )
			"/login" ( controller:'Home', action:'login' )
			"/register" ( controller:'Home', action:'register' )
			"/logout" ( controller:'Home', action:'logout' )
		// Custom Errors
			// All
				"/error"(controller: "Error", action: "index")
			// Http
				"/401"(controller: "Error", action: "error401")
				"/402"(controller: "Error", action: "error402")
				"/403"(controller: "Error", action: "error403")
				"/404"(controller: "Error", action: "error404")
				"/405"(controller: "Error", action: "error405")
				"/500"(controller: "Error", action: "error500")
				"/501"(controller: "Error", action: "error401",exception: AccessDeniedException)
				"/502"(controller: "Error", action: "error502",exception: NotFoundException)
				"/503"(controller: "Error", action: "error503")
	}
	
}
