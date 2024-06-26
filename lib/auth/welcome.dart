import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/main_screen.dart';
import 'login.dart';
import 'signup.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String id = '/welcome';

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);

    final session = supabase.auth.currentSession;
    if (session != null) {
      Navigator.pushReplacementNamed(context, MainScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('logo/logo.png'),
                radius: 100,
                backgroundColor: Colors.transparent,
              ),
              const Text(
                'CineStore',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text('Create a Movie Library for yourself!',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              ElevatedButton(
                // Log In Button
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff4055C6)),
                  fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: const Text('Sign In',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
                child: const Text('Sign Up',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
