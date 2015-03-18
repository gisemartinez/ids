package abm

import java.util.Date;

class Estado {

	String nombre
	
	//Fecha del alta del estado
    Date fechaAlta=new Date()
    //Fecha de baja del estado-por default: 31/12/2999
    Date fechaBaja=new Date('2999/12/31')

    static def listado(idBienActual){
    	def A_EVALUAR = "A Evaluar"
	    def EN_USO = "En uso"
	    def A_REPARAR = "A Reparar"
	    def A_DONACION = "A donacion"
	    def A_DESCARTE = "A descarte"
	    def DE_BAJA = "Baja"
    	if (idBienActual)
    	{
    		def estado = Bien.findById(idBienActual).estado
    		println estado
    		switch(estado.nombre) {
    			case A_EVALUAR:
    				return Estado.where{
	    				nombre == A_DONACION || 
	    				nombre == EN_USO || 
	    				nombre == A_REPARAR ||
	    				nombre == A_DESCARTE
	    			}.findAll();
    				
    			break;
    			case A_DONACION:
    				return Estado.where{
	    				nombre == DE_BAJA
	    			}.findAll();
    				
    			break;
    			case EN_USO:
    				return Estado.where{
	    				nombre == A_EVALUAR
	    			}.findAll();
    				
    			break;
    			case A_REPARAR:
    				return Estado.where{
	    				nombre == A_DESCARTE || 
	    				nombre == EN_USO
	    			}.findAll();
    				
    			break;
    			case A_DESCARTE:
    				return Estado.where{
	    				nombre == DE_BAJA
	    			}.findAll();
    				
    			break;
    			default :
    				return Estado.findAll()
    				
    			break;

    		}
    		/*if (estado.nombre == "A Evaluar") 
    		{
    			return Estado.where
    			{
    				nombre == "A Donacion" || 
    				nombre == "En Uso"|| 
    				nombre == "A Reparar"||
    				nombre == "A Descarte"
    			}.findAll();
    		}
    		else
    		{

    		}*/
    	
    	}
    	else
    	{
    		return Estado.findByNombre("A Evaluar")
    	}
    	
    }

	static constraints = {
	}
	
	String toString(){
		nombre
	}
}
