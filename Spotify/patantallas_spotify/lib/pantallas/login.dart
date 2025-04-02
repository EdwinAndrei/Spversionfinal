import 'package:flutter/material.dart';
import 'pantalla_principal.dart'; // Asegúrate de que la ruta sea correcta

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Inicializamos los controladores con los valores ya definidos
  final TextEditingController _emailController =
      TextEditingController(text: 'prueba@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '123456');

  String _errorMessage = '';

  void _login() {
    if (_emailController.text == 'prueba@gmail.com' &&
        _passwordController.text == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PantallaSpotify(),
        ),
      );
    } else {
      setState(() {
        _errorMessage =
            'El usuario o contraseña es incorrecta.\n(Error code: auth:2)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos un Stack para superponer la imagen de fondo y el contenido
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Filtro para oscurecer el fondo
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Contenido centrado (cuadrito de login)
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: 320, // Ajusta este valor para modificar el ancho del cuadrito
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo de Spotify
                    Image.asset(
                      'assets/spotifylogo.jpg',
                      width: 150,
                    ),
                    const SizedBox(height: 30),
                    if (_errorMessage.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(bottom: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.red[400],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    TextField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[850],
                        hintText: 'Email o nombre de usuario',
                        hintStyle: const TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[850],
                        hintText: 'Contraseña',
                        hintStyle: const TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('LOG IN'),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Acción para continuar con Facebook
                        },
                        icon: const Icon(Icons.facebook, color: Colors.white),
                        label: const Text(
                          'Continuar con facebook',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        // Acción para SIGNUP
                      },
                      child: const Text(
                        "No tienes una cuenta? REGISTRATE",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
