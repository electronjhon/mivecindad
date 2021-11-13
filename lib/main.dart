import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mivecindad/pantalla2.dart';

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
      title: 'Flutter Demo',
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

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Listado de negocios"),
      ),
      body: Center(

        child: ListView.builder(
          itemCount: datos_negocios.length,
          itemBuilder: (BuildContext context,i){
            return ListTile(
              title: Text("Negocio "+i.toString()+" - "+datos_negocios[i]['Nombre'].toString()),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> pantalla2()));
          }, label: Text("Siguiente"),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}
