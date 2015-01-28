package abm

import java.util.Date;

class Bien {

       String codigoPatrimonio

       String nombreBien

	String codigoDeSerie

       String descripcion
       //relacion de tablas
       static belongsTo= [estado:Estado,area:Area,ubicacion: Ubicacion,tipo:Tipo,responsableBien:Persona]
      
       //Fecha del alta del bien
       Date fechaAlta=new Date()
       //Fecha de baja del bien-por default: 31/12/2999
       Date fechaBaja=new Date('2999/12/31')
               
       static constraints = {
       		
       }
}
