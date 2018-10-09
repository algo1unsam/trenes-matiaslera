import Vagon.*
import deposito.*
import Locomotoras.*
class Formacion{
	
	var vagones = [] //de pasajeros y de carga
	var locomotoras =[]
	
	method agregarLocomotora(locomotora){
		locomotoras.add(locomotora)
	}
	method agregarVagones(locomotora){
		vagones.add(locomotora)
	}
	method cuantosVagonesLivianos(){
		return vagones.size({vagon=>vagon.esLiviano()})
	}
	
	method velocidadMaxima(){
		return locomotoras.min({loco=>loco.velocidadMaxima()}).velocidadMaxima()
	}//La velocidad máxima de una formación, que es el mínimo entre las velocidades máximas de las locomotoras.
	
	method esEficiente(){
		return locomotoras.all({loco=>loco.esEficiente()})
	}
	
	method arrastreUtilTotal(){
		return locomotoras.sum({loco=>loco.arrastreUtil()})
	}
	
	method pesosTotalVagones(){
		return vagones.sum({vagon=>vagon.pesoMaximo()})
	}
	method pesoTotalLocomotoras(){
		return locomotoras.sum({loco=>loco.pesoLocomotora()})
	}
	
	method puedeMoverse(){
		return self.arrastreUtilTotal()>=self.pesosTotalVagones()
	}
	
	method cuantoEmpujeLeFalta(){
		if(self.puedeMoverse())
		return 0 
		else 
		return self.pesosTotalVagones()-self.arrastreUtilTotal()
	}
	
	method vagonMasPesado(){
		return vagones.max({vagon=>vagon.pesoMaximo()})
	}
	method cantidadDeVagones(){
		return vagones.size()
	}
	
	method cantidadDeLocomotoras(){
		return locomotoras.size()
	}
	method formacionLarga(){
		return 20 > self.cantidadDeVagones()+self.cantidadDeLocomotoras()
	}
	
	method esMuyPesada(){
		return 10000> self.pesosTotalVagones()+self.pesoTotalLocomotoras()
	}
	
	method esCompleja(){
		return self.formacionLarga() or self.esMuyPesada()
	}
	
	method velocidadMaximaLegal()
		
	
}

class FormacionCortaDistancia inherits Formacion {

	method estaBienArmada() {
		return self.puedeMoverse() and not self.esCompleja()
	}

	method velocidadMAxima() = self.velocidadMaxima().min(60)

//	override method velocidadMaxima() {
//		return self.velocidadMaximaDeLocomotoras().min(self.velocidadMaximaLegal())
//	}
	override method velocidadMaximaLegal() = 60

}

class FormacionLargaDistancia inherits Formacion {

	const origen = null
	const destino = null

	method estaBienArmada() {
		return self.puedeMoverse() and not self.tieneSuficienteBanios()
	}

	method tieneSuficienteBanios() {
		return self.cantidadDeBanios() >= vagones.cantidadDePasajeros() / 50
	}

	method cantidadDeBanios() {
		return vagones.sum{ vagones => vagones.cantidadDeBanios() }
	}

	// override	method velocidadMaxima() {
//		return self.velocidadMaximaDeLocomotoras().min(self.velocidadMaximaLegal())
//	}
	override method velocidadMaximaLegal() {
		return if (origen.esGrande() and destino.esGrande()) 200 else 150
	}

}

class FormacionAltaVelocidad inherits FormacionLargaDistancia{
	
	override method  estaBienArmada(){
		return self.velocidadMaxima() > 250 and vagones.all({vagon=>vagon.esLiviano()})
	}
	
}

class Ciudad {
	
	const property esGrande = false
}


