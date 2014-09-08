package abm

import com.testapp.User
import org.apache.commons.lang.builder.HashCodeBuilder

class PersonaUser implements Serializable{

	private static final long serialVersionUID = 1
	PersonaUser(Persona p, User u){
		this.personaId = p.id
		this.userId= u.id
	}

	long personaId
	long userId
	
    static constraints = {
    }

    static mapping = {
    	id composite: ['userId','personaId']
    	version false
    }


}

