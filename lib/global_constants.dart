import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

late final Dio dio;
FirebaseAuth firebaseAuthInstace = FirebaseAuth.instance;

initFirebase() async {
  await Firebase.initializeApp();
}
