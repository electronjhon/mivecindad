import 'package:firebase_messaging/firebase_messaging.dart';

class recibiendoMensajes {

  FirebaseMessaging mensaje = FirebaseMessaging.instance;

  notificaciones(){

    mensaje.requestPermission();
    mensaje.getToken().then((token)  {
      print('------ TOKEN ------- ');
      print(token);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) { //App abierta

    });                                          //App 2do plano
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

    });                                          // Cerrada
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {

    });

  }
}