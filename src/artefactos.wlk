import personaje.*
import hechizos.*
import refuerzos.*

//Punto 2
class ArtefactoConPeso {

	var peso // en Kg
	var fechaDeCompra

	method factorDeCorreccion() {
		return 1.min((new Date() - fechaDeCompra) / 1000)
	}

	method pesoTotal(_Personaje) {
		return peso - self.factorDeCorreccion()
	}

}

class ArmasAtaque {

	var unidadesDeLucha = 3

	method unidadesDeLucha(_personaje) {
		return unidadesDeLucha
	}

	method valorLista() {
		return 5 * unidadesDeLucha
	}

}

class Espada inherits ArmasAtaque {

}

class Hacha inherits ArmasAtaque {

}

class Lanzas inherits ArmasAtaque {

}

class CollarDivino inherits ArtefactoConPeso {

	var property cantidadPerlas

	constructor(_cantidadPerlas) {
		cantidadPerlas = _cantidadPerlas
	}

	method unidadesDeLucha(_personaje) {
		return cantidadPerlas
	}

	method valorLista() {
		return 2 * cantidadPerlas
	}

	override method pesoTotal(_Personaje) {
		return peso - self.factorDeCorreccion() + (cantidadPerlas * 0.5)
	}

}

class Mascara inherits ArtefactoConPeso {

	var property indiceDeOscuridad = 1
	var property poderMinimo = 4

	method unidadesDeLucha(_personaje) {
		return (poderMinimo).max((mundo.fuerzaOscura() / 2) * indiceDeOscuridad)
	}

	override method pesoTotal(_Personaje) {
		return peso - self.factorDeCorreccion() + 0.max(self.unidadesDeLucha(_Personaje) - 3)
	}

}

object espejo {

	method unidadesDeLucha(personaje) {
		if (self.artefactosSinEspejo(personaje).isEmpty()) {
			return 0
		} else {
			return self.mejorArtefactoDe(personaje).unidadesDeLucha(personaje)
		}
	}

	method artefactosSinEspejo(personaje) {
		return personaje.artefactos().filter({ artefacto => artefacto != self })
	}

	method mejorArtefactoDe(personaje) {
		return self.artefactosSinEspejo(personaje).max({ artefacto => artefacto.unidadesDeLucha(personaje) })
	}

	method valorLista() {
		return 90
	}

}

class Armadura inherits ArtefactoConPeso {

	var property refuerzo
	var property valorBase = 2

	constructor(_refuerzo) {
		refuerzo = _refuerzo
	}

	method unidadesDeLucha(personaje) {
		return valorBase + refuerzo.poder(personaje)
	}

	method valorLista() {
		return valorBase + refuerzo.valorLista()
	}

	method cambiarRefuerzo(nuevoRefuerzo) {
		refuerzo = nuevoRefuerzo
	}

	override method pesoTotal(_Personaje) {
		return refuerzo.peso()
	}

}

