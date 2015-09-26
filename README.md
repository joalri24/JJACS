# JJACS

#Ejemplos de rutas

Conductores:

GET conductores

GET conductores/1

POST conductores

parametros {nombre: Big Mac, cedula: 1234}

PUT conductores/1
parametros {puntaje: 2.4}

DELETE conductores/6


Tranvias:

GET tranvias

GET tranvias/1

POST tranvias
parametros {numero_identificacion: 100, linea: 1}

PUT tranvias/1
parametros {latitud: 100, longitud: -12.5, estado: 1, kilometros_desde_revision: 10.5, temperatura: 15.7, boton_panico: true, id_conductor: 1  }
