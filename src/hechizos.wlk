import personaje.*
import artefactos.*
import refuerzos.*

class Hechizo {

	var property nombre

	method valorLista() {
		return self.poder()
	}

	method poder() { // como el esPodero pide que retorne algo dejo 10 que es el poder del basico
		return 10
	}

	method esPoderoso() {
		return self.poder() > 15
	}

}

class Logos inherits Hechizo {

	var property valorMultiplicativo

	constructor(_nombre, _valorMultiplicativo) {
		valorMultiplicativo = _valorMultiplicativo
	}

	override method poder() {
		return nombre.size() * valorMultiplicativo
	}

}

class Basico inherits Hechizo {

}

//punto 1
class HechizoComercial inherits Hechizo {

	var porcentajeDeNombre = 0.2
	var multiplicadorDePoder = 2

	override method poder() {
		return nombre.size() * porcentajeDeNombre * multiplicadorDePoder
	}

}

class LibroDeHechizos {

	var property hechizos = []

	constructor(_hechizos) {
		hechizos.addAll(_hechizos)
	}

	method poder() {
		return self.hechizosPoderosos().sum({ hechizoPoderoso => hechizoPoderoso.poder() })
	}

	method hechizosPoderosos() {
		return hechizos.filter({ hechizo => hechizo.esPoderoso() })
	}

	method esPoderoso() {
		return self.poder() > 15
	}

	method cantidadDeHechizos() {
		return hechizos.size()
	}

	method valorLista() {
		return 10 * self.cantidadDeHechizos() + self.poder() // en el metodo self.poder() interpretamos que solo los hechizos poderosos otorgan poder.
	}

}

