import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'login.dart';
import 'dart:math' as math;

// COLORS
const Color mediumBlue = Color.fromARGB(255, 142, 177, 209);

void main() {
  runApp(const MyApp());
}

// APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: beige,
      ),

      home: const ChoiceScreen(),
    );
  }
}

// CHOICE SCREEN
class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  // TOP BLUE HEADER (With 15px padding from edges)
                  Positioned(
                    top: 5,
                    left: 5,
                    right: 5,
                    child: Container(
                      height: 213,
                      decoration: const BoxDecoration(
                        color: paleBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  // SSITE
                  const Positioned(
                    top: 160,
                    left: 30,
                    child: Text(
                      'SSITE',
                      style: TextStyle(
                        fontFamily: 'Space',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: darkBlue,
                        letterSpacing: 7,
                        shadows: [
                          Shadow(
                            offset: Offset(3, 2),
                            color: lightBlue,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // VERIFUND
                  const Positioned(
                    top: 190,
                    left: 45,
                    child: Text(
                      'VeriFund',
                      style: TextStyle(
                        fontFamily: 'Press',
                        fontSize: 35,
                        color: darkBlue,
                      ),
                    ),
                  ),

                  // LOGOS
                  Positioned(
                    top: 160,
                    right: 30,
                    child: Row(
                      children: [
                        _buildCircleIcon(
                          Image.asset(
                            'lib/assets/MCC.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 5),
                        _buildCircleIcon(
                          Image.asset(
                            'lib/assets/ICS.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 5),
                        _buildCircleIcon(
                          Image.asset(
                            'lib/assets/SSITE.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // "ARE YOU A..."
                  const Positioned(
                    top: 267,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'are you a...',
                        style: TextStyle(
                          fontFamily: 'Pixelify',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: darkBlue,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 0),
                              color: lightBlue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // SSITE BUTTON
                  Positioned(
                    top: 293,
                    left: 30,
                    child: _buildChoiceButton(
                      text: 'SSITE',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  // STUDENT BUTTON
                  Positioned(
                    top: 293,
                    right: 30,
                    child: _buildChoiceButton(
                      text: 'Student',
                      onTap: () {
                        // TODO: Navigate to Student screen
                      },
                    ),
                  ),

                  // BOTTOM DARK BLUE SHAPE (EDGE-TO-EDGE & MAXIMIZED)
                  Positioned(
                    top: constraints.maxHeight * 0.62,
                    left: 0,
                    right: 0,
                    bottom: 0, // Fits flush to the bottom edge
                    child: ClipPath(
                      clipper: BottomCurveClipper(),
                      child: Container(
                        color: darkBlue,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // LOGO CIRCLE
  Widget _buildCircleIcon(Image image) {
    return SizedBox(
      width: 35,
      height: 35,
      child: image,
    );
  }

  // CHOICE BUTTON
  static Widget _buildChoiceButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 135,
        height: 130,
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(6, 7),
              blurRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Pixelify',
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),
        ),
      ),
    );
  }
}

// BOTTOM CURVE
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from bottom-left
    path.moveTo(0, size.height);

    // Left side
    path.lineTo(0, 115);

    // Large curved top
    path.quadraticBezierTo(
      size.width * 0.38,
      -10,
      size.width,
      35,
    );

    // Right side
    path.lineTo(
      size.width,
      size.height,
    );

    // Close shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(
      CustomClipper<Path> oldClipper,
      ) {
    return false;
  }
}