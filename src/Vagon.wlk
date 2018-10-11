import trenes.*


class VagonPasajeros{
	
	var property largoTotal // lo estoy usando
//	var property anchoTotal
//	var property largoUtil
	var property anchoUtil //lo estoy usando

	method cantidadDePasajeros(){
		if (anchoUtil<=2.5)
		return largoTotal * 8
		else
		return largoTotal * 10
	}
	
	method pesoMaximo(){
		return self.cantidadDePasajeros() * 80
	}
	
	method esLiviano(){
		return self.pesoMaximo() < 2500
	}
	
	method cantidadDeBanios() {
		if (self.cantidadDePasajeros() < 50) return 1 else return self.cantidadDePasajeros() / 50
	}
	//De cada vagón de pasajeros se conoce el largo en metros, y el ancho útil también en metros. La cantidad de pasajeros que puede transportar un vagón de pasajeros es:
	 //- Si el ancho útil es de hasta 2.5 metros: metros de largo * 8. - Si el ancho útil es de más de 2.5 metros: metros de largo * 10.
}

class VagonDeCargas{
	
	var cargaMaxima
	
	method cantidadDePasajeros(){
		return 0
	}
	
	method pesoMaximo(){
		return cargaMaxima+160
	}
	
	method esLiviano(){
		return self.pesoMaximo()< 2500
	}
	
	method cantidadDeBanios(){
		return 0
	}
}