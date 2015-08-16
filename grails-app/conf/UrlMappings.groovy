class UrlMappings {

	static mappings = {
          
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        
        "/index"(view:"/index")
        "/"(view:"/index")
        "500"(view:'/error')
        "/permisos"(view:"/permisos")
        "/qrcode"(view:"/qrcode")
        "/mdl"(view:"/mdl")
	}
}
