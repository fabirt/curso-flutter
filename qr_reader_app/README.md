# QR reader app

Esta aplicación cuenta con las siguientes características:
- Lanzar la cámara y leer un código QR
- Manejo de almacenamiento interno utilizando una base de datos SQLite 
- Mapas
- Enlaces a páginas web

## Funcionamiento

La aplicación lee un código QR e identifica si la información recibida corresponde a un enlace de una página web
ó a una geolocalización. Si es un enlace, abre el navegador con dicha página web. En caso de recibir una geolocaización, navega a
una vista donde se muestra un mapa y un marcador con dicha ubicación.
Todos los datos escaneados se guardan en una base de datos SQLite interna.
El mapa se implementó utilizando [The Mapbox Geocoding API](https://docs.mapbox.com/api/search/#geocoding)

## Screenshots
