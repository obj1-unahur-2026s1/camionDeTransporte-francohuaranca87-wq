import cosas.*
object camion {
    const cosasCargadas = []

    method cargar(unaCosa) {
        cosasCargadas.add(unaCosa)
    }

    method descargar(unaCosa) {
        cosasCargadas.remove(unaCosa)
    }

    method peso() = 1000 + cosasCargadas.sum({c => c.peso()})

    method lasCosasSonDePesosPares() = cosasCargadas.all({c => c.peso().even()})
}
