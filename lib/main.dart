import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/pantalla1.dart';
import 'package:mivecindad/pantalla2.dart';
import 'package:mivecindad/pantalla3.dart';
import 'package:mivecindad/pantalla4.dart';
import 'package:mivecindad/consultaProducto.dart';
import 'package:mivecindad/registroCliente.dart';

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
          style: TextStyle(fontStyle:   FontStyle.italic,fontSize: 25),),
      ),
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
        icon: Icon(Icons.add,size: 30,color: Colors.white,),
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
        }else{
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
            icon: Icon(Icons.cases),
            label: 'Categorias'
        )
      ],
    );
  }
}
