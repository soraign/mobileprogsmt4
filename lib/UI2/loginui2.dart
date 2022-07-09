import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectsaya/UI/listdata_ui.dart';
import 'package:projectsaya/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginUI2 extends StatelessWidget {
  const LoginUI2({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => AuthProvider()),
      builder: (context, w) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
      body: Container(
        child: Center(
          child: Consumer<AuthProvider>(
            builder: (context, prov, w) {
          return ElevatedButton.icon(
            onPressed: (){
              prov.auth().then((user) {
                Navigator.push(context, MaterialPageRoute(builder: (c)=>ListDataUI()));
                
              });
              
    
            }, 
               icon: Icon(Icons.key),
               label: const Text('login via google')
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

