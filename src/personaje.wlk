import hechizos.*
import refuerzos.*
import artefactos.*

class Personaje {

	var property artefactos = []
	var property valorBaseDeHechizo = 3
	var property valorBaseDeLucha
	var property hechizoPreferido
	var property objetivos = []
	var property monedas = 100
	var property capacidadDeCarga

	constructor(_artefactos, _valorBaseDeLucha, _hechizoPreferido, _objetivos) {
		artefactos.addAll(_artefactos)
		valorBaseDeLucha = _valorBaseDeLucha
		hechizoPreferido = _hechizoPreferido
		objetivos.addAll(_objetivos)
	}

	method nivelDeHechiceria() {
		return (valorBaseDeHechizo * hechizoPreferido.poder()) + mundo.fuerzaOscura()
	}

	method seCreePoderoso() {
		return hechizoPreferido.esPoderoso()
	}

	method nivelDeLucha() {
		return valorBaseDeLucha + self.valorDeArtefactos(self)
	}

	method valorDeArtefactos(personaje) {
		return artefactos.sum({ artefacto => artefacto.unidadesDeLucha(personaje) })
	}

	method agregarArtefacto(artefacto) {
		if (self.capacidadDeCarga() >= (self.cargaTotal() + artefacto.pesoTotal(self))){
			artefactos.add(artefacto)
		} else {
			self.error("No se posee una capasidad de carga suficiente")
		}
	}

	method cargaTotal() {
		return artefactos.sum({ artefacto => artefacto.pesoTotal(self) })
	}

	method quitarArtefacto(artefacto) {
		artefactos.remove(artefacto)
	}

	method tieneMayorNivelDeLuchaQueDeHechiceria() {
		return self.nivelDeLucha() > self.nivelDeHechiceria()
	}

	method estaCargado() {
		return artefactos.size() >= 5
	}

	method obtenerMonedas(cantidad) {
		monedas += cantidad
	}

	method pagarAdquisicion(cantidad) {
		monedas -= cantidad
	}

	method cumplirObjetivo(objetivo) {
		objetivos.remove(objetivo)
		self.obtenerMonedas(10)
	}

	method puedeComprar(adquisicion, ganancia) {
		return monedas + ganancia < adquisicion.valorLista()
	}

	method valorPorHechizo() {
		return hechizoPreferido.valorLista() / 2
	}

	method canjearHechizoPreferido(nuevoHechizo) {
		if (self.puedeComprar(nuevoHechizo, self.valorPorHechizo())) {
			self.error("No se puede canjear el nuevo hechizo")
		} else {
			self.pagarAdquisicion(0.max(nuevoHechizo.valorLista() - self.valorPorHechizo()))
			hechizoPreferido = nuevoHechizo
		}
	}

	method comprarArtefacto(nuevoArtefacto) {
		if (self.puedeComprar(nuevoArtefacto, 0)) {
			self.error("No se puede comprar el artefacto")
		} else {
			self.pagarAdquisicion(nuevoArtefacto.valorLista())
			self.agregarArtefacto(nuevoArtefacto)
		}
	}

}

object mundo {

	var property fuerzaOscura = 5

	method eclipse() {
		self.fuerzaOscura(fuerzaOscura * 2)
	}

}

