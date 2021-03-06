import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mivecindad/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mivecindad/pantalla1.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// *****  RESULTADO DATOS NEGOCIO SELECCIONADO EN EL LISTADO COMPLETO   ****

class pantalla2 extends StatelessWidget {

  final datosNegocio negocio;

  const pantalla2({required this.negocio});



  @override
  Widget build(BuildContext context) {
    late GeoPoint pos = negocio.posicion;
    final posicion = CameraPosition(
        target: LatLng(pos.latitude, pos.longitude),
        zoom: 15
    );

    final Set<Marker> marcador = Set();
    String cedula="123456";

    marcador.add(
        Marker(
            markerId: MarkerId(cedula),
            position: LatLng(pos.latitude, pos.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            infoWindow: InfoWindow(
                title: negocio.Nombre,
                snippet: "Tel: "+negocio.Telefono
            )


        )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Pan2 Datos Negocio '+negocio.Nombre),
      ),
      drawer: menu(),
      body: ListView(
        children: [
          miCardImage(url: negocio.Logo,
              texto: negocio.Nombre
                  + ' \n ✆ : ' + negocio.Telefono.toString()
                  + ' \n ➤ : ' + negocio.Direccion),


          Container(
            width:300,
            height:500,
            padding: EdgeInsets.all(30),
              child: GoogleMap(
                initialCameraPosition: posicion,
                scrollGesturesEnabled: true, //activar - desactivar mover el mapa
                zoomGesturesEnabled: false, //activar - desactivar zoom con la mano
                zoomControlsEnabled: true, // descativar botones zoom
                mapType: MapType.normal,
                markers: marcador,
              ),
          ),

          Center(                      //   BOTON  A  WEB
            child: ElevatedButton.icon(
              onPressed: (){
                launch(negocio.Web.toString());
              },
              icon: Icon(Icons.travel_explore_outlined),
              label: Text('Mi pagina web'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(300, 40),         //  TAMAÑO DEL BOTON
              ),
            ),
          ),

          Column(
            children: [

              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(6.0)
                ),
                child: Text(' ↓  Nuestros Productos ↓ ',style: TextStyle(fontSize: 27),),
              ),
              Container(        //    CONTAINER  PARA IMAGEN
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Colors.black,
                    width: 6,
                  ),
                ),
                child: Image.network(negocio.Imagen,scale: 1.0,),
                height: 450.0,
                width: 450.0,

              ),
              Container(          //    CONTAINER  PARA IMAGEN1
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Colors.black,
                    width: 6,
                  ),
                ),
                child: Image.network(negocio.Imagen1,scale: 1.0,),
                height: 450.0,
                width: 450.0,
              ),
              Container(        //    CONTAINER  PARA IMAGEN2
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Colors.black,
                    width: 6,
                  ),
                ),
                child: Image.network(negocio.Imagen2,scale: 1.0,),
                height: 450.0,
                width: 450.0,

              ),
              Container(        //    CONTAINER  PARA IMAGEN3
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Colors.black,
                    width: 6,
                  ),
                ),
                child: Image.network(negocio.Imagen3,scale: 1.0,),
                height: 450.0,
                width: 450.0,

              ),
              Container(        //    CONTAINER  PARA IMAGEN4
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Colors.black,
                    width: 6,
                  ),
                ),
                child: Image.network(negocio.Imagen4,scale: 1.0,),
                height: 450.0,
                width: 450.0,

              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla3()));
          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        }, label: Text("Atras"),
        icon: Icon(Icons.arrow_left),
      ),
    );
  }
}