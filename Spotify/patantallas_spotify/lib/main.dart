import 'package:flutter/material.dart';
import 'pantallas/login.dart'; 

void main() {
  runApp(const SpotifyCloneApp());
}

class SpotifyCloneApp extends StatelessWidget {
  const SpotifyCloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LoginScreen(),  // se inicializa el programa 
    );
  }
}
