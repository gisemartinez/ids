package abm

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPERVISOR','ROLE_ENCARGADO','ROLE_OPERARIO'])
class EstadisticaController {

	def bienService

	@Secured(['ROLE_SUPERVISOR','ROLE_ENCARGADO'])
    def index(){
        def opt =['#21AAFF', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6','#e6693e']
        render(
            view:'index',
            model:
            [
                a: bienService.bienesAEvaluar().size(),
                b: bienService.bienesEnUso().size(),
                c: bienService.bienesAReparar().size(),
                d: bienService.bienesADonacion().size(),
                e: bienService.bienesADescarte().size(),
                f: bienService.bienesBaja().size(), 
                opt: opt
            ]
        );
    }

}
