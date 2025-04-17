object tom {
    var ultimoRatonComido = null

    var distanciaRecorrida = 0

    var energia = 50

    method correr(cantidadDeMetrosACorrer){
        energia -= (cantidadDeMetrosACorrer / 2)
        distanciaRecorrida += cantidadDeMetrosACorrer
    }

    method comer(ratonAComer) {
        energia += 12 + ratonAComer.peso()
        ultimoRatonComido = ratonAComer
    }

    method cazarAlRaton_ADistancia_(ratonACazar, distanciaARecorrer){
        if(self.puedeCazarADistancia_(distanciaARecorrer)) {
            self.correr(distanciaARecorrer)
            self.comer(ratonACazar)
        }
    }

    method puedeCazarADistancia_(distanciaARecorrer) = energia >= distanciaARecorrer / 2

    method ultimoRatonComido() = ultimoRatonComido

    method distanciaRecorrida() = distanciaRecorrida

    method energia() = energia

    method velocidadMaxima() = 5 + energia / 10
}

object jerry {
    var edad = 2

    method peso() = edad * 20

    method cumplirAnios() {
        edad += 1
    }
}

object nibbles {
    method peso() = 35
}

object perez {
    var cantidadDeMonedas = 10

    method velocidad() = 20 - cantidadDeMonedas
    
    method peso() {
        if (self.puedeEscapar()) {
            self.agarrarUnaMoneda()
            return 0
        }
        else {
            self.tirarUnaMoneda()
            return 5 + cantidadDeMonedas * 5
        }
            
    } 

    method puedeEscapar() = self.velocidad() >= 10

    method cambiarCantidadDeMonedas(cantidadDeMonedasACambiar) {
        cantidadDeMonedas = cantidadDeMonedasACambiar
    }

    method tirarUnaMoneda() {
        self.cambiarCantidadDeMonedas(cantidadDeMonedas - 1)
    }

    method agarrarUnaMoneda() {
        self.cambiarCantidadDeMonedas(cantidadDeMonedas + 1)
    }
}