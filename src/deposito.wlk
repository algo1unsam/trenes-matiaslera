class Deposito {
	
	var formaciones=[]
	var property locomotorasSueltas = []
	
	method vagonesPesados(){
		return formaciones.map({tren=>tren.vagonMasPesado()})
		
	}
	method necesitaUnConductorExperimentado(){
		return formaciones.any({formacion=>formacion.esCompleja()})
	}
	
	method agregarLocomotoraAFormacion(formacion) {
		if (!formacion.puedeMoverse()) {
			formacion.add(self.buscarLocomotoraSueltaApta(formacion))
		}
	}

	method buscarLocomotoraSueltaApta(formacion) {
		return locomotorasSueltas.find{ locomotora => locomotora.arrastreUtil() >= formacion.empuje() }
	}
	
	
}
