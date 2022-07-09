import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectsaya/UI/login_ui.dart';
import 'package:projectsaya/UI2/loginui2.dart';
import 'package:projectsaya/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
 

  runApp(const MaterialApp(
    title: 'Login Via Google',
    home:  LoginUI2(),
    
  ));

   
}