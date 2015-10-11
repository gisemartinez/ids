package abm

import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent

@Secured(['ROLE_SUPERVISOR','ROLE_ENCARGADO','ROLE_OPERARIO'])
class EstadisticaController {

	def bienService

	@Secured(['ROLE_SUPERVISOR','ROLE_ENCARGADO'])
    def index(){
        def opt =['#21AAFF', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6','#e6693e']
        def bienes_creados = AuditLogEvent.findAllByEventNameAndClassName("INSERT","Bien")
        def bienes_borrados = AuditLogEvent.findAllByEventNameAndClassName("DELETE","Bien")
        def personas_creadas = AuditLogEvent.findAllByEventNameAndClassName("INSERT","Persona")
        def personas_borradas = AuditLogEvent.findAllByEventNameAndClassName("DELETE","Persona")
        def bienes_sistemas = bienService.getBienesSegunPermiso(0,0,"").findAll{it.area.id == 1}
        def bienes_quimica = bienService.getBienesSegunPermiso(0,0,"").findAll{it.area.id == 2}
        def bienes_electrica = bienService.getBienesSegunPermiso(0,0,"").findAll{it.area.id == 3}
        def bienes_mecanica = bienService.getBienesSegunPermiso(0,0,"").findAll{it.area.id == 4}

        // https://grails.github.io/grails-doc/latest/ref/Domain%20Classes/findAllBy.html
        // results = Book.findAllByReleaseDateBetween(firstDate, new Date())
        // results = Book.findAllByReleaseDateGreaterThanEquals(firstDate)

        // https://grails.org/plugin/spring-security-eventlog
        // https://github.com/ataylor284/spring-security-eventlog

        render(
            view:'index',
            model:
            [
                evaluar: bienService.bienesAEvaluar().size(),
                usar: bienService.bienesEnUso().size(),
                reparar: bienService.bienesAReparar().size(),
                donar: bienService.bienesADonacion().size(),
                descartar: bienService.bienesADescarte().size(),
                baja: bienService.bienesBaja().size(), 
                bienes_creados: bienes_creados.size(),
                bienes_borrados: bienes_borrados.size(),
                personas_creadas: personas_creadas.size(),
                personas_borradas: personas_borradas.size(),
                bienes_sistemas: bienes_sistemas.size(),
                bienes_quimica: bienes_quimica.size(),
                bienes_electrica: bienes_electrica.size(),
                bienes_mecanica: bienes_mecanica.size(),
                opt: opt
            ]
        );
    }
}
