import 'package:chamsoccaytrong/page/login/login_page.dart';
import 'package:chamsoccaytrong/page/main/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_dart/firebase_core_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  handleAuthState(){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData){
            return HomePage();
          }else{
            return const LoginPage();
          }
        }
    );
  }
  signInWithGoogle()async {
    final GoogleSignInAccount? googleUser =await GoogleSignIn(
      scopes: <String>["email"]).signIn();//googleSignIn

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken:googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut(){
    FirebaseAuth.instance.signOut();
  }
}