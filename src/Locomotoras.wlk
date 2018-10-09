import trenes.*
import Vagon.*
class Locomotora{
	
	var property pesoLocomotora  = 1000
	var property velocidadMaxima = 80
	var property pesosMaximoArrastre = 12000
	
	method arrastreUtil(){
		return pesosMaximoArrastre - pesoLocomotora
	}
	
	method esEficiente(){
		return 5 > (pesosMaximoArrastre/pesoLocomotora)
	}
}

