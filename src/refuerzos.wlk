import personaje.*
import hechizos.*
import artefactos.*

class RefuerzoHechizo {

	var property hechizo
	var property nombre

	method poder(_personaje) {
		return hechizo.poder()
	}

	method valorLista() {
		return hechizo.valorLista()
	}

	method peso() {
		if (hechizo.poder() % 2) {
			return 2
		} else {
			return 1
		}
	}

}

class CotaDeMalla {

	var property unidadDeLucha

	constructor(_unidadDeLucha) {
		unidadDeLucha = _unidadDeLucha
	}

	method poder(_personaje) {
		return unidadDeLucha
	}

	method valorLista() {
		return unidadDeLucha / 2 - 2
	}

	method peso() {
		return 1
	}

}

class Bendicion {

	method poder(personaje) {
		return personaje.nivelDeHechiceria()
	}

	method valorLista() {
		return 0
	}

	method peso() {
		return 0
	}

}

object espacioParaRefuerzo {

	method poder(_personaje) {
		return 0
	}

	method valorLista() {
		return 0
	}

	method peso() {
		return 0
	}

}

