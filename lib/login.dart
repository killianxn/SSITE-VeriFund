import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dashboard.dart';
import 'main.dart';

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
      home: const LoginScreen(),
    );
  }
}

// LOGIN SCREEN
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: beige,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Stack(
                  children: [
                    // TOP BLUE HEADER
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

                    // BACK BUTTON
                    Positioned(
                      top: 15,
                      left: 15,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: darkBlue,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ChoiceScreen()));
                        },
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

                    // FORM CONTAINER
                    Positioned(
                      top: 245,
                      left: 40,
                      right: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SSITE Log In TITLE
                          const Text(
                            'SSITE  Log  In',
                            style: TextStyle(
                              fontFamily: 'Space',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: darkBlue,
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 0),
                                  color: lightBlue,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),

                          // EMAIL TEXTBOX
                          _buildCustomTextField(
                            label: 'Email:',
                            controller: _emailController,
                          ),
                          const SizedBox(height: 12),

                          // PASSWORD TEXTBOX
                          _buildCustomTextField(
                            label: 'Password:',
                            controller: _passwordController,
                            isPassword: true,
                          ),
                          const SizedBox(height: 10),

                          // --or-- SEPARATOR
                          const Text(
                            '--or--',
                            style: TextStyle(
                              fontFamily: 'Pixelify',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: darkBlue,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // GOOGLE SIGN-IN BUTTON
                          _buildGoogleButton(
                            onTap: () {
                              // TODO: Google Sign-in action
                            },
                          ),
                          const SizedBox(height: 15),

                          // LOG IN BUTTON
                          _buildLoginButton(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                            },
                          ),
                        ],
                      ),
                    ),

                    // BOTTOM DARK BLUE SHAPE
                    Positioned(
                      top: constraints.maxHeight * 0.8,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: ClipPath(
                        clipper: BottomCurveClipper(),
                        child: Container(
                          color: darkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // LOGO CIRCLE
  Widget _buildCircleIcon(Widget child) {
    return SizedBox(
      width: 35,
      height: 35,
      child: child,
    );
  }

  // RETRO TEXTBOX WIDGET
  Widget _buildCustomTextField({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Pixelify',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: darkBlue,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black, width: 3),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(4, 5),
                blurRadius: 0,
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Pixelify',
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }

  // GOOGLE BUTTON
  Widget _buildGoogleButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png',
            width: 22,
            height: 22,
            errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.g_mobiledata, size: 28, color: Colors.red),
          ),
        ),
      ),
    );
  }

  // LOG IN BUTTON
  Widget _buildLoginButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 42,
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(5, 5),
              blurRadius: 0,
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'Log In',
            style: TextStyle(
              fontFamily: 'Pixelify',
              fontSize: 18,
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

    path.moveTo(0, size.height);
    path.lineTo(0, 115);

    path.quadraticBezierTo(
      size.width * 0.38,
      -10,
      size.width,
      35,
    );

    path.lineTo(
      size.width,
      size.height,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}