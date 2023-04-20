import 'package:chamsoccaytrong/page/forgot/forgot_page.dart';
import 'package:chamsoccaytrong/page/forgot/success_page.dart';
import 'package:chamsoccaytrong/page/login/login_page.dart';
import 'package:chamsoccaytrong/page/main/home/home_page.dart';
import 'package:chamsoccaytrong/page/main/main_page.dart';
import 'package:chamsoccaytrong/page/onboarding/onboarding_page.dart';
import 'package:chamsoccaytrong/page/signup/signup_page.dart';
import 'package:chamsoccaytrong/page/signup/verify/verify_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chamsoccaytrong/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spending Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? "/"
          : (FirebaseAuth.instance.currentUser!.emailVerified
          ? '/main'
          : '/verify'),
      routes: {
        '/': (context) => const OnboardingPage(),
        //'/login': (context) => const LoginPage(),
        //'/signup': (context) => const SignupPage(),
        '/home': (context) => const HomePage(),
        '/main': (context) => const MainPage(),
        '/forgot': (context) => const ForgotPage(),
        '/success': (context) => const SuccessPage(),
        '/verify': (context) => const VerifyPage()
      },
    );
  }
}
