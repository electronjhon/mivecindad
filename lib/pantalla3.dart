import 'package:flutter/material.dart';
import 'package:mivecindad/pantalla1.dart';
import 'package:mivecindad/pantalla4.dart';

import 'main.dart';

//  *****  TEXTFIELD  PARA INGRESAR BUSQUEDA POR CATEGORIA **************

class pantalla3 extends StatelessWidget {
  //const pantalla3({Key? key}) : super(key: key);

  TextEditingController dato = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta por Categoria en Pantalla 3'),
      ),
      drawer: menu(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(21.0),
          child: GridView.count(
            crossAxisCount: 3, //cantidad de items
            crossAxisSpacing: 9, // espacio en vertical
            mainAxisSpacing: 9, //espacio en horizontal
            children: [
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/sPmMddi.jpeg',
                          scale: 0.5,
                          //width: 99,
                          //height: 99,
                        ),
                        Text('Asaderos',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Asaderos')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/9ztQMRj.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Panaderias',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Panaderias')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/0b1K4Qc.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Bares',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Bares')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/7xoVd8T.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Droguerias',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Droguerias')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/eGiesAF.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Cafeterias',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Cafeterias')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/26zoD3S.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Cafe Internet',
                            style: TextStyle(fontSize: 15, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Cafe Internet')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/ZXfcBnr.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Minitiendas',
                            style: TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Minitiendas')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/coFKMdb.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Fruterias',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Fruterias')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/8x2dyeQ.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Famas',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Famas')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/Xqaf7uP.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Supermercados',
                            style: TextStyle(fontSize: 12, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Supermercados')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/kasYXK3.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Papelerias',
                            style: TextStyle(fontSize: 13, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Papelerias')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/o2F8KIY.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Peluquerias',
                            style: TextStyle(fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Peluquerias')));
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black, width: 2)
                  ),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i.imgur.com/LojKvUV.jpeg',
                          scale: 0.5,
                          //width: 90,
                          //height: 90,
                        ),
                        Text('Restaurantes',
                            style: TextStyle(fontSize: 15, color: Colors.black)),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla4('Restaurantes')));
                  }),

            ],
          ),
        ),
      ),
      bottomNavigationBar: barrainferior(),

    );

  }
}

class barrainferior extends StatelessWidget {
  String title=" ";
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white38,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blue,
      onTap: (index){
        if(index==0){
          print('redirecciona a inicio'); //linea para regresar a inicio sin importar la ruta
          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        }else {
          //var t=DateTime.now();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla1(title: title)));

          //print(t);
        }/*else{
          print("va a consulta categoria");
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla3()));
        } */

      },
      items: [

        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Negocios'
        ),/*
        BottomNavigationBarItem(
            icon: Icon(Icons.cases),
            label: 'Categorias'
        )*/
      ],
    );
  }
}