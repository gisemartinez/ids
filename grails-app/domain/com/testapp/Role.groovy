package com.testapp

class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
	static String permisoSesionActual ( idRolSesionActual ){
        return Role.findById( idRolSesionActual ).authority
    }
}
