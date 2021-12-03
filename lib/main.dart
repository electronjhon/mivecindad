import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/comprobarCliente.dart';
import 'package:mivecindad/mensaje.dart';
import 'package:mivecindad/moduloPedido.dart';
import 'package:mivecindad/pantalla1.dart';
import 'package:mivecindad/pantalla2.dart';
import 'package:mivecindad/pantalla3.dart';
import 'package:mivecindad/pantalla4.dart';
import 'package:mivecindad/consultaProducto.dart';
import 'package:mivecindad/registroCliente.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi vecindad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List datos_negocios=[];
  void initState(){
    super.initState();
    getNegocios();
  }

void getNegocios() async{
  CollectionReference datos= FirebaseFirestore.instance.collection("Negocios"); //conecte a la coleccion
  QuerySnapshot negocios= await datos.get(); //traer todos los negocios
  if(negocios.docs.length>0){ //trae datos
    print("Trae datos...");
    for(var doc in negocios.docs){
      print(doc.data());
      setState(() {
        datos_negocios.add(doc.data());
      });
    }
  }else{
    print("Ha fallado...");
  }
}
  @override
  Widget build(BuildContext context) {
    String title="";
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:  Text(" Mi Vecindad ",
          style: GoogleFonts.satisfy(
            textStyle: TextStyle(color: Colors.white,
            fontSize: 36)
          ),
          //style: TextStyle(fontStyle:   FontStyle.italic,fontSize: 25),
        ),
      ),
        drawer: menu(),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top:0.0),
                //color: Colors.cyanAccent,
                //padding: EdgeInsets.all(20.0),
                child: Image.network("https://i.pinimg.com/550x/e4/e1/fb/e4e1fb324a6796b50c3c6cd800b937f2.jpg",height: 710,width: 710,)
            ),
          ],

        ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> registroClientes()));
          }, label: Text("Registrarse"),
        icon: Icon(Icons.add_circle,size: 30,color: Colors.white,),
      ),
        bottomNavigationBar: barrainferior()

    );
  }
}

// ***********  barra inferior  BottomNavigator ***********************
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
          print('redirecciona a productos pantalla 5');
          Navigator.push(context, MaterialPageRoute(builder: (context)=> consultaProducto()));
          // Navigator.pop(context);
        }else if(index==1){
          //var t=DateTime.now();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla1(title: title)));

          //print(t);
        }else{    // va a pantalla3
          print("va a consulta categoria");
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla3()));
        }

      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Productos'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Negocios'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias'
        )
      ],
    );
  }
}

class menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent
              ),
              child: Center(
                child: Text('Mi vecindad',
                style: GoogleFonts.satisfy(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      wordSpacing: 12
                  )
                  ),
                ),
              )
          ),

          Column(
            children: [
              ListTile(
                /*leading: Icon(Icons.account_circle_outlined,
                    size: 30,
                    color: Colors.lightBlue), */
                title: Text('       Bienvenido',
                  style: GoogleFonts.lobsterTwo(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 21)
                  ),
                ),
                onTap: () {
                 // Navigator.push(context,
                      //   MaterialPageRoute(builder: (context)=>main()));
                  // Navigator.push(context,
                  //  Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                },

              ),
              ListTile(
                leading: Icon(Icons.home,
                    size: 30,
                    color: Colors.lightBlue),
                title: Text('Inicio',
                  style: GoogleFonts.lobsterTwo(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 21)
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>MyApp()));
                },

              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart,
                    size: 30,
                    color: Colors.lightBlue),
                title: Text('Realizar una compra',
                  style: GoogleFonts.lobsterTwo(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 21)
                  ),
                ),
                onTap: () {
                   Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>moduloPedido()));
                },

              ),
              ListTile(
                leading: Icon(Icons.add_circle,
                    size: 30,
                    color: Colors.lightBlue),
                title: Text('Registrarse',
                  style: GoogleFonts.lobsterTwo(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 21)
                  ),
                ),
                onTap: () {
                   Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>registroClientes()));
                },

              ),
              ListTile(
                leading: Icon(Icons.badge_outlined,
                    size: 30,
                    color: Colors.lightBlue),
                title: Text('Actualizar datos',
                  style: GoogleFonts.lobsterTwo(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 21)
                  ),
                ),
                onTap: () {
                   Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>comprobarCliente()));
                },

              ),
              ListTile(
                leading: Icon(Icons.shopping_bag,
                    size: 30,
                    color: Colors.lightBlue),
                title: Text('Consultar Productos',
                  style: GoogleFonts.lobsterTwo(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 21)
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>consultaProducto()));
                },

              ),
              ListTile(
                leading: Icon(Icons.category,
                    size: 30,
                    color: Colors.lightBlue),
                title: Text('Consulta por categoria',
                  style: GoogleFonts.lobsterTwo(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 21)
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>pantalla3()));
                },

              ),
              ListTile(    //COmentario
                leading:
                Icon(Icons.notifications_active, size: 30, color: Colors.blue),
                enabled: true,
                title: Text("Notificaciones",
                    style: GoogleFonts.lobsterTwo(
                        textStyle: TextStyle(color: Colors.black, fontSize: 21))),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => mensaje()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}