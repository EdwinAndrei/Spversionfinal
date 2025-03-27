import 'package:flutter/material.dart';

class PantallaSpotify extends StatefulWidget {
  const PantallaSpotify({super.key});

  @override
  _PantallaSpotifyState createState() => _PantallaSpotifyState();
}

class _PantallaSpotifyState extends State<PantallaSpotify> {
  String _selectedCategory = 'Todo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
      ),
      body: Row(
        children: [
          _buildLibraryPanel(),
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
                    
                    _buildPlaylistSection('Hecho para Ti', [
                      {'title': 'Tus me gusta', 'image': 'assets/foto.png'},
                      {'title': 'Mix diario 1', 'image': 'assets/mix.jfif'},
                      {'title': 'Mix Bad Bunny', 'image': 'assets/debi.jfif'},
                      {'title': 'Mix Rock', 'image': 'assets/rock.jfif'},
                      {'title': 'Djo', 'image': 'assets/djo.jfif'},
                      {'title': 'Tu Top de canciones 2024', 'image': 'assets/top.jfif'},
                      {'title': 'Kendrick Lamar - Halftime Hits', 'image': 'assets/kendri.jpg'},
                      {'title': 'Mix 80', 'image': 'assets/80.jfif'},
                    ]),

                    
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
        ],
      ),
    );
  }

  // Lateral izquierdo
  Widget _buildLibraryPanel() {
    return Container(
      width: 250,
      color: Colors.black,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tu biblioteca', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
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

  // Banner superior 
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

  // Botones de categoría
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
  
  Widget _buildPlaylistSection(String title, List<Map<String, String>> playlists) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 10),
        SizedBox(
          height: 180, // Ajusta la altura de las tarjeta
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: playlists.length,
            separatorBuilder: (context, _) => SizedBox(width: 10),
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return SizedBox(
                width: 140, // Ajusta el ancho de las tarjeta
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  ícono de play sobrepuesto
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
      ],
    );
  }

  Widget _buildTwoColumnGridSection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,   // filas en vertical
            childAspectRatio: 4, // tarjeta horizontal
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
}