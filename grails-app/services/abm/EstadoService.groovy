package abm

import grails.transaction.Transactional

@Transactional
class EstadoService {

    //constantes

    def A_EVALUAR = "A Evaluar"
    def EN_USO = "En uso"
    def A_REPARAR = "A Reparar"
    def A_DONACION = "A donacion"
    def A_DESCARTE = "A descarte"
    def DE_BAJA = "Baja"

    def getEstadoAEvaluar(){
        return A_EVALUAR
    }
    def getEstadoEnUso(){
        return EN_USO
    }
    def getEstadoAReparar(){
        return A_REPARAR
    }
    def getEstadoADonacion(){
        return A_DONACION
    }
    def getEstadoADescarte(){
        return A_DESCARTE
    }
    def getEstadoDeBaja(){
        return DE_BAJA
    }
    def listado(idBienActual){
    	

    	if (idBienActual)
    	{
    		def estado = Bien.findById(idBienActual).estado
    		println estado
    		switch(estado.nombre) {
    			case this.getEstadoAEvaluar():
    				return Estado.where{
	    				nombre == this.getEstadoADonacion() || 
	    				nombre == this.getEstadoEnUso() || 
	    				nombre == this.getEstadoAReparar() ||
	    				nombre == this.getEstadoADescarte() ||
                        nombre == this.getEstadoAEvaluar()
	    			}.findAll();
    				
    			break;
    			case this.getEstadoADonacion:
    				return Estado.where{
	    				nombre == this.getEstadoDeBaja() ||
                        nombre == this.getEstadoADonacion()
	    			}.findAll();
    				
    			break;
    			case this.getEstadoEnUso():
    				return Estado.where{
	    				nombre == this.getEstadoAEvaluar()||
                        nombre == this.getEstadoEnUso()
	    			}.findAll();
    				
    			break;
    			case this.getEstadoAReparar():
    				return Estado.where{
	    				nombre == this.getEstadoADescarte() || 
	    				nombre == this.getEstadoEnUso() ||
                        nombre == this.getEstadoAReparar()
	    			}.findAll();
    				
    			break;
    			case this.getEstadoADescarte():
    				return Estado.where{
	    				nombre == this.getEstadoDeBaja() ||
                        nombre == this.getEstadoADescarte()
	    			}.findAll();
    				
    			break;
    			default :
    				return Estado.findAll()
    				
    			break;

    		}
    		
    	
    	}
    	else
    	{
    		return Estado.findByNombre("A Evaluar")
    	}
    	
    }

}
