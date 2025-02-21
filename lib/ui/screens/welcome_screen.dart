import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of local image paths
    final List<String> imgList = [
      'assets/images/welcome1.png',
      'assets/images/welcome2.png',
      'assets/images/welcome3.png',
    ];

    return Scaffold(
      body: Column(
        children: [
          // Welcome Message
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Pacifico', // Use a calligraphic font
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Carousel
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                // You can handle page change here if needed
              },
            ),
            items:
                imgList
                    .map((item) => Center(child: Image.asset(item)))
                    .toList(),
          ),
          SizedBox(height: 20),
          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      // Use the carousel controller to navigate to the selected page
                      // Note: You cannot use a controller in a StatelessWidget
                      // This is just a placeholder for the logic
                    },
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).primaryColorLight),
                      ),
                    ),
                  );
                }).toList(),
          ),
          SizedBox(height: 20),
          // Login Button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              backgroundColor: Colors.red,
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
