import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider with ChangeNotifier{
  
  final FirebaseAuth _fbauth = FirebaseAuth.instance;

  Future<User?> auth()async{
    try{
      final gsign  = await GoogleSignIn().signIn();
      final gauth = await gsign?.authentication;
      final kredensial = GoogleAuthProvider.credential(
        accessToken: gauth?.accessToken,
        idToken: gauth?.idToken
      );
      await _fbauth.signInWithCredential(kredensial);
      await GoogleSignIn().signOut();
      notifyListeners();
    }catch(e){
      print('error melakukan auth : $e');
    }
    return _fbauth.currentUser;
  }
}