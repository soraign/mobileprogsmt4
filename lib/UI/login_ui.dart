import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectsaya/UI/listdata_ui.dart';
import 'package:projectsaya/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => AuthProvider()),
      builder: (context, w) {
      return  Scaffold(
        //AppBar
        appBar: AppBar(
          leading: Icon(FontAwesomeIcons.userCircle),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.arrowCircleRight),
              onPressed: ()=> exit(0),
              tooltip: 'Close app',
            )
          ],
          backgroundColor: Color.fromARGB(255, 27, 64, 94),
          title: const Text('Login'),
        ),

        //BGWP

      body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(32),
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bglogin.png"),
          fit: BoxFit.cover,
      
        ),
      ),


        //BGWP

        //Tombol Google SignIn
        
        child: Center(
          child: Consumer<AuthProvider>(
            builder: (context, prov, w) {
          return ElevatedButton.icon(
            onPressed: (){
              prov.auth().then((user) {
                Navigator.push(context, MaterialPageRoute(builder: (c)=>ListDataUI()));
                
              });
              
    
            }, 
               icon: Image.asset("assets/images/googleico.png", height: 20, width: 20,), 
               label: const Text('Login Dengan Google')
            );
            }
            ),
        
          
        ),
      ),
      );
      }
    );
    
  }
} 

