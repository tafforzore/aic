import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PullToRefreshPage extends StatelessWidget {
  // Méthode de rafraîchissement simulée
  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    // Ajoutez ici la logique pour actualiser les données de votre carrousel
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pull-to-refresh Carrousel"),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.builder(
          itemCount: 20, // Nombre d'éléments dans le carrousel ou la liste
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text("Item $index"),
                subtitle: Text("Description de l'élément"),
                leading: Icon(Icons.image),
              ),
            );
          },
        ),
      ),
    );
  }
}


class ImageSliderScreen extends StatelessWidget {
  final List<String> _imageUrls = [
    'https://via.placeholder.com/800x400.png?text=Image+1',
    'https://via.placeholder.com/800x400.png?text=Image+2',
    'https://via.placeholder.com/800x400.png?text=Image+3',
    'https://via.placeholder.com/800x400.png?text=Image+4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Slider'),
        centerTitle: true,
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            scrollDirection: Axis.horizontal,
          ),
          items: _imageUrls.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'Image ${_imageUrls.indexOf(imageUrl) + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ImageSliderScreen(),
  ));
}


class PullToRefreshCarousel extends StatelessWidget {
  // Méthode de rafraîchissement simulée
  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    // Ajoutez ici la logique pour actualiser les données du carrousel
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrousel Pull-to-refresh"),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: PageView.builder(
          itemCount: 5, // Nombre de pages dans le carrousel
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  "Page $index",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
