package abm

import java.util.Date;

class Bien {
	String codigoDeSerie

       String descripcion
       //relacion de tablas
       static belongsTo= [estado:Estado,area:Area,ubicacion: Ubicacion,tipo:Tipo]
      
       //Fecha del alta del bien
       Date fechaAlta=new Date()
       //Fecha de baja del bien-por default: 31/12/2999
       Date fechaBaja=new Date()
               
       static constraints = {
       		
       }
}