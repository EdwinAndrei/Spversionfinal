import 'package:flutter/material.dart';
import 'pantallas/pantalla_principal.dart'; // Asegúrate de que la ruta de la pantalla principal sea correcta

void main() {
  runApp(SpotifyCloneApp());
}

class SpotifyCloneApp extends StatelessWidget {
  const SpotifyCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PantallaSpotify(), // Aquí se instancia la pantalla PantallaSpotify
    );
  }
}