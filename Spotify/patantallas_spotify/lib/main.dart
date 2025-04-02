import 'package:flutter/material.dart';
import 'pantallas/login.dart'; // Asegúrate de que la ruta y el nombre del archivo sean correctos

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
      home: const LoginScreen(), // Aquí se inicia con el login
    );
  }
}
