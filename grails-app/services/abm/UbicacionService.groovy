package abm

class UbicacionService {
    def getUbicaciones(max, offset, query){
        // si el rol es Admin, traigo todos los bienes.En caso contrario, traigo los bienes que correspondan al area de la persona
        if (max == 0) {
            return Ubicacion.findAll("from Ubicacion where (INSTR(nombreubica,?)>0 or INSTR(fechaAlta,?)>0))",[query,query])
        }
        else {
            return Ubicacion.findAll("from Ubicacion where (INSTR(nombreubica,?)>0 or INSTR(fechaAlta,?)>0))",[query,query],[max: max, offset: offset.toInteger()])
        }
    }

    def ordenarLista(ArrayList lista, String ordenarPor, String orden){
        return lista.sort{
            a, b -> 
                if (orden == 'desc') {
                    b."${ordenarPor}" <=> a."${ordenarPor}"
                } else {
                    a."${ordenarPor}" <=> b."${ordenarPor}"
                }
        }
    }
}
