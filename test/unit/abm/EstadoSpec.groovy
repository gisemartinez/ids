package abm

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Estado)
class EstadoSpec {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
		def estados = [
			new Estado(nombre: "A evaluar"),
			new Estado(nombre: "Baja")]
	estados*.save(flush: true)
	assertEquals 2, Estado.list().size()
	
    }
	void "test something1"() {
		def estados1 = [
			new Estado(nombre: " evaluar"),
			new Estado(nombre: "baja")]
	estados1*.save(flush: true)
	assertEquals 0, Estado.list().size()
	}
	
	void "test something2"() {
		def estado3= new Estado(nombre: "evaluar")
	estado3*.save(flush: true)
	assertTrue estado3.nombre == "evaluar"
	}
	
	void "test something3"() {
		def estado4= new Estado(nombre: "evaluar")
	estado4*.save(flush: true)
	assertFalse estado4.nombre == "Baja"
	}
}
