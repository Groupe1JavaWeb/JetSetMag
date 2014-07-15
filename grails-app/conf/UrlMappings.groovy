class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?(.$format)?"{
			constraints {
				// apply constraints here
			}
		}		
		"/" ( controller:'Home', action:'index' )
		"/home" ( controller:'Home', action:'index' )
		"/login" ( controller:'User', action:'login' )
		"/logout" ( controller:'User', action:'logout' )
		"/register" ( controller:'User', action:'register' )		
		"/error"(controller: "Error", action: "index")
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
