object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10
}

object bumbleBee{
    var formaActual = auto
    method peso() = 800
    method nivelDePeligrosidad() = formaActual.nivelDePeligrosidad()
    method transformar(){
        if (formaActual == auto){
            formaActual = robot
        } else{
            formaActual = auto
        }
    }
}
//----------
//Transformaciones de bumbleBee
object auto { method nivelDePeligrosidad() = 15 }

object robot { method nivelDePeligrosidad() = 30 }
//------------

object paqueteDeLadrillos{
    var cantidad = 1
    method peso() = 2 * cantidad
    method nivelDePeligrosidad() = 2
    method actualizarCantLadrillos(nuevaCant) {
        cantidad = nuevaCant
    }
}

object arenaAGranel {
    var property peso = 0 //con property evito generar accesos [peso() y peso(nuevoPeso)]
    method nivelDePeligrosidad() = 1
}

object bateriaAntiAerea {
    var tieneMisiles = falso
    method alternarCargaDeMisiles() {
        tieneMisiles = !tieneMisiles
    }
    method peso() = if (tieneMisiles) 300 else 200
    method nivelDePeligrosidad() = if (tieneMisiles) 100 else 0
}

object contenedorPortuario {
    const cosasCargadas = []
    method peso() = 100 + cosasCargadas.sum({c => c.peso()})
    method nivelDePeligrosidad() = cosasCargadas.maxIfEmpty({c => c.nivelDePeligrosidad()}, 0)
}
object residuosRadioactivos {
    var property peso = 0 //con property evito generar accesos [peso() y peso(nuevoPeso)]
    method nivelDePeligrosidad() = 200
}
object embalajeDeSeguridad {
    var envuelveA = residuosRadioactivos //unaCosa
    method envuelveA(unaCosa){
        envuelveA = unaCosa
    }
    method peso() = envuelveA.peso()

    method nivelDePeligrosidad() = envuelveA.nivelDePeligrosidad() / 2
}