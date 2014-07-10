class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/" ( controller:'Home', action:'index' )
		
        "500"(view:'/error')
		"501"(view:'/error')
		"502"(view:'/error')
		"503"(view:'/error')
		"404"(view:'/error')
		"405"(view:'/error')
	}
	
}
