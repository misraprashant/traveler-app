import 'package:flutter/material.dart';
class PlaceDetailPage extends StatelessWidget {
  final String placeName;
  final String location;
  final double rating;
  final String imageUrl;

  PlaceDetailPage({
    required this.placeName,
    required this.location,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Detail'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Full-screen image
                  Container(
                    height: 300,
                    child: Stack(
                      children: [
                        Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                          height: 300,
                          width: double.infinity,
                        ),
                        // Details container
                        Positioned(
                          bottom: 14.0,
                          left: 8.0,
                          right: 8.0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  placeName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      location,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.yellow),
                                        Text(
                                          rating.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Overview details text
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mount Fuji, standing proudly at 3,776.24 meters above sea level, is Japan\'s tallest and most revered peak, situated on Honshu Island, southwest of Tokyo. As an active stratovolcano, its last eruption dates back to the Edo period in 1707–1708. Revered in Japanese culture and religion, Mount Fuji is a UNESCO World Heritage Site, recognized for its profound impact on the arts and its symbolic significance. Its silhouette is a recurrent theme in Japanese art, literature, and poetry. Pilgrims and climbers flock to its slopes during the climbing season, drawn to its cultural significance and breathtaking views. The Five Lakes region at its base offers picturesque landscapes, enhancing the allure of this iconic symbol of Japan. Mount Fuji\'s accessibility from major cities like Tokyo and Yokohama makes it a popular destination, embodying the nation\'s natural beauty and cultural heritage.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // "Book Now" button at the bottom
          Container(
            width: 200,
            margin: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
