import trenes.*


class VagonPasajeros{
	
	var property largoTotal 
	var property anchoTotal
	var property largoUtil
	var property anchoUtil

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
}

class VagonDeCargas{
	
	var cargaMaxima
	
	method pesoMaximo(){
		return cargaMaxima+160
	}
	
	method esLiviano(){
		return self.pesoMaximo()< 2500
	}
}