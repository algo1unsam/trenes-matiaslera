import Vagon.*

class Formacion{
	
	var vagones = [] //de pasajeros y de carga
	var locomotoras =[]
	
	method cuantosVagonesLivianos(){
		return vagones.size({vagon=>vagon.esLiviano()})
	}
	
}


