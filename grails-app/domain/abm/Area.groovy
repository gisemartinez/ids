package abm

import java.util.Date;

class Area {
	
	   String nombrearea

	    //Fecha del alta del area
       Date fechaAlta=new Date()
       //Fecha de baja del area-por default: 31/12/2999
       Date fechaBaja=new Date('2999/12/31')
			
			static constraints = {
			}
			
			String toString(){
				nombrearea
			}
		}