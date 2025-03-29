import 'package:flutter/material.dart';

 class PantallaSpotify extends StatefulWidget {
  const PantallaSpotify({Key? key}) : super(key: key);

  @override
  _PantallaSpotifyState createState() => _PantallaSpotifyState();
}

class _PantallaSpotifyState extends State<PantallaSpotify> {
  String _selectedCategory = 'Todo';

  // Variables para el reproductor
  bool _isPlaying = false;
  double _currentPosition = 0.0; // Posición actual (en segundos)
  final double _songDuration = 230.0; // Duración total (ejemplo: 230 segundos)

  // Controlador de scroll para la sección "Hecho para Ti"
  final ScrollController _hechoParaTiScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildPlaybackBar(), // Barra de reproducción
      body: Row(
        children: [
          // Panel lateral izquierdo
          _buildLibraryPanel(),

          // Contenido central
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBannerSection(),
                    SizedBox(height: 10),
                    _buildCategoryButtons(),
                    SizedBox(height: 10),
                    // Sección "Hecho para ti" con botones para scroll horizontal
                    _buildPlaylistSectionWithArrows(
                      'Hecho para Ti',
                      [
                        {'title': 'Tus me gusta', 'image': 'assets/foto.png'},
                        {'title': 'Mix diario 1', 'image': 'assets/mix.jfif'},
                        {'title': 'Mix Bad Bunny', 'image': 'assets/debi.jfif'},
                        {'title': 'Mix Rock', 'image': 'assets/rock.jfif'},
                        {'title': 'Djo', 'image': 'assets/djo.jfif'},
                        {'title': 'Tu Top de canciones 2024', 'image': 'assets/top.jfif'},
                        {'title': 'Kendrick Lamar - Halftime Hits', 'image': 'assets/kendri.jpg'},
                        {'title': 'Mix 80', 'image': 'assets/80.jfif'},
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildTwoColumnGridSection('Tus mixes mas escuchados', [
                      {'title': 'Tus me gusta', 'image': 'assets/foto.png'},
                      {'title': 'Rock', 'image': 'assets/rock.jfif'},
                      {'title': 'DeBí TIRAR MÁS FOTOs', 'image': 'assets/debi.jfif'},
                      {'title': 'Mix 80', 'image': 'assets/80.jfif'},
                      {'title': 'Mix diario 1', 'image': 'assets/mix.jfif'},
                      {'title': 'Mix Rock', 'image': 'assets/rock.jfif'},
                      {'title': 'Tu Top de canciones 2024', 'image': 'assets/top.jfif'},
                    ]),
                  ],
                ),
              ),
            ),
          ),

          // Panel lateral derecho con Scrollbar vertical
          _buildRightPanel(),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // PANEL LATERAL DERECHO CON SCROLL VERTICAL
  // -------------------------------------------------------------
  Widget _buildRightPanel() {
    return Container(
      width: 300,
      color: Colors.black,
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // GIF arriba
              Container(
                width: 210,
                height: 210,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/kick.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Imagen del artista en medio SIN overlay (sin franjas)
              Container(
                width: 210,
                height: 210,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/kick.jfif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Información abajo
              Container(
                width: 210,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '9.732.611 oyentes mensuales',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Motley Crue han sido una de las mejores banda metal.',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    // Información adicional para forzar scroll
                    SizedBox(height: 20),
                    Text(
                      'Información adicional:',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      'Mötley Crüe ha vendido más de 80 millones de álbumes en todo el mundo, incluyendo 25 millones en los Estados Unidos. ' *
                          5,
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              // Espacio extra para que se active el scroll
              SizedBox(height: 400),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------
  // APP BAR
  // -------------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        children: [
          Text(
            'Spotify',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '¿Qué quieres reproducir?',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.person, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  // -------------------------------------------------------------
  // BANNER SUPERIOR
  // -------------------------------------------------------------
  Widget _buildBannerSection() {
    return Container(
      height: 350,
      color: Colors.green[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              List<String> images = [
                'assets/hiphop.jfif',
                'assets/rock.jfif',
                'assets/kick.jfif',
                'assets/Thunderstruck.jfif'
              ];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: 210,
                  height: 210,
                  child: _bannerItem(images[index]),
                ),
              );
            }),
          ),
          SizedBox(height: 20),
          Text(
            'Escucha todos los éxitos del momento',
            style: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _bannerItem(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }

  // -------------------------------------------------------------
  // BOTONES DE CATEGORÍA
  // -------------------------------------------------------------
  Widget _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _categoryButton('Todo'),
        _categoryButton('Música'),
        _categoryButton('Podcasts'),
      ],
    );
  }

  Widget _categoryButton(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[850],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: Size(70, 30),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        onPressed: () {},
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
      ),
    );
  }

  // -------------------------------------------------------------
  // PANEL LATERAL IZQUIERDO
  // -------------------------------------------------------------
  Widget _buildLibraryPanel() {
    return Container(
      width: 250,
      color: Colors.black,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tu biblioteca',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.playlist_play, color: Colors.white),
              Icon(Icons.person, color: Colors.white),
              Icon(Icons.search, color: Colors.white),
              Icon(Icons.add, color: Colors.white),
              Icon(Icons.history, color: Colors.white),
            ],
          ),
          SizedBox(height: 10),
          _libraryItem('Tus me gusta', 'assets/tusmegustas.png'),
          _libraryItem('Mötley Crüe', 'assets/monte.jpg'),
          _libraryItem('Eminem', 'assets/eminem.jpg'),
          _libraryItem('Your Top Songs 2024', 'assets/2024.jfif'),
          _libraryItem('2Pac', 'assets/2pac.jpg'),
          _libraryItem('Red Hot Chili Peppers', 'assets/chili.jpg'),
          _libraryItem('Un verano sin ti', 'assets/verano.jfif'),
          _libraryItem('Natanael cano', 'assets/nata.jpg'),
        ],
      ),
    );
  }

  Widget _libraryItem(String title, String imagePath) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(imagePath, width: 40, height: 40, fit: BoxFit.cover),
      ),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {},
    );
  }

  // -------------------------------------------------------------
  // SECCIÓN DE PLAYLISTS (SCROLL HORIZONTAL) + BOTONES DE DESPLAZAMIENTO
  // -------------------------------------------------------------
  Widget _buildPlaylistSectionWithArrows(String title, List<Map<String, String>> playlists) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 10),
        // Fila con flecha izquierda, ListView horizontal y flecha derecha
        Row(
          children: [
            // Botón flecha izquierda
            IconButton(
              icon: Icon(Icons.arrow_left, color: Colors.white),
              onPressed: () {
                _hechoParaTiScrollController.animateTo(
                  _hechoParaTiScrollController.offset - 200,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            // ListView horizontal
            Expanded(
              child: SizedBox(
                height: 180,
                child: ListView.separated(
                  controller: _hechoParaTiScrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: playlists.length,
                  separatorBuilder: (context, _) => SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final playlist = playlists[index];
                    return SizedBox(
                      width: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Imagen con ícono de play sobrepuesto
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  playlist['image']!,
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Icon(Icons.play_circle_fill, color: Colors.green, size: 30),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            playlist['title']!,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            // Botón flecha derecha
            IconButton(
              icon: Icon(Icons.arrow_right, color: Colors.white),
              onPressed: () {
                _hechoParaTiScrollController.animateTo(
                  _hechoParaTiScrollController.offset + 200,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  // -------------------------------------------------------------
  // SECCIÓN EN 2 COLUMNAS (Tus mixes más escuchados)
  // -------------------------------------------------------------
  Widget _buildTwoColumnGridSection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      item['image']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item['title']!,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // -------------------------------------------------------------
  // BARRA DE REPRODUCCIÓN
  // -------------------------------------------------------------
  Widget _buildPlaybackBar() {
    return Container(
      color: Colors.black,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            // Portada, título y artista
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      'assets/kick.jfif',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'kickstart my heart',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Mötley Crüe',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Controles centrales
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.shuffle, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_previous, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.repeat, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Íconos derechos
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.queue_music, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Convierte segundos a formato "min:seg"
  String _formatTime(double seconds) {
    final int sec = seconds.round();
    final int min = sec ~/ 60;
    final int remainder = sec % 60;
    final String remainderString = remainder < 10 ? '0$remainder' : remainder.toString();
    return '$min:$remainderString';
  }
}