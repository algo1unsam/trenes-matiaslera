import trenes.*
import Vagon.*
class Locomotora{
	
	var pesoLocomotora
	var velocidadMaxima
	var pesosMaximoArrastre
	
	method pesosMaximoArrastre(){
		return pesosMaximoArrastre - pesoLocomotora
	}
}