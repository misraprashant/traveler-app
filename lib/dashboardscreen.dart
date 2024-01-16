import 'package:bmdutask/placedetailwidet.dart';
import 'package:flutter/material.dart';
class TravelApp extends StatefulWidget {
  const TravelApp({Key? key}) : super(key: key);
  @override
  _TravelAppState createState() => _TravelAppState();
}
class _TravelAppState extends State<TravelApp> {
  String selectedButton = 'Most Viewed';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, David',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Text(
                          "Explore the world ",
                          style: TextStyle(color: Colors.grey.shade400),
                        )
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/persons.jpg'),
                      radius: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search places',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Section 3
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Popular Places',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () {
                            // Handle View All button press
                          },
                          child: const Text('View All'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundedButton(
                          text: 'Most Viewed',
                          isSelected: selectedButton == 'Most Viewed',
                          onTap: () {
                            setState(() {
                              selectedButton = 'Most Viewed';
                            });
                          },
                        ),
                        RoundedButton(
                          text: 'Nearby',
                          isSelected: selectedButton == 'Nearby',
                          onTap: () {
                            setState(() {
                              selectedButton = 'Nearby';
                            });
                          },
                        ),
                        RoundedButton(
                          text: 'Latest',
                          isSelected: selectedButton == 'Latest',
                          onTap: () {
                            setState(() {
                              selectedButton = 'Latest';
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Section 4
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getPlaces(selectedButton).length,
                    itemBuilder: (context, index) {
                      return PlaceCard(
                        placeName: getPlaces(selectedButton)[index]['name'],
                        location: getPlaces(selectedButton)[index]['location'],
                        rating: getPlaces(selectedButton)[index]['rating'],
                        imageUrl: getPlaces(selectedButton)[index]['imageUrl'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> getPlaces(String category) {
    // You can replace this with your actual data or fetch it from an API
    if (category == 'Most Viewed') {
      return [
        {
          'name': 'Mount Fuji , Tokyo',
          'location': 'Tokyo Japan',
          'rating': 4.8,
          'imageUrl': 'assets/fuji.png'
        },
        {
          'name': 'Andes',
          'location': 'South,America',
          'rating': 4.5,
          'imageUrl': 'assets/andes.jpg'
        },

        // Add more data for "Most Viewed"
      ];
    } else if (category == 'Nearby') {
      return [
        {
          'name': 'Place 1',
          'location': 'Location 1',
          'rating': 4.2,
          'imageUrl': 'assets/andes.jpg'
        },
        // Add more data for "Nearby"
      ];
    } else if (category == 'Latest') {
      return [
        {
          'name': 'Place 2',
          'location': 'Location 2',
          'rating': 4.8,
          'imageUrl': 'assets/fuji.png'
        },
        // Add more data for "Latest"
      ];
    }
    return [];
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const RoundedButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? Colors.black : Colors.grey.shade200,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade800,
          ),
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String placeName;
  final String location;
  final double rating;
  final String imageUrl;

  PlaceCard({
    required this.placeName,
    required this.location,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          margin: EdgeInsets.only(right: 16),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceDetailPage(
                              placeName: placeName,
                              location: location,
                              rating: rating,
                              imageUrl: imageUrl,
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.asset(
                          imageUrl,
                          height: 350,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      style: TextStyle(color: Colors.white),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
