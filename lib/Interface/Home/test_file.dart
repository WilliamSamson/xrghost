import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xrghost/core/imports.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 400,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white70,
            //   borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.share_location,
                color: Colors.black,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                'About Me',
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10, // Instead of top: 0, place it at the bottom
          right: 0,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(
                3.1415926535897932), // Rotate 180 degrees (π radians)
            child: ClipPath(
              clipper: RoundedTopLeftSlantedBottomClipper(),
              child: Container(
                width: 220,
                height: 100,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 300,
            height: 350,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: CircleAvatar(
            radius: 85,
            child: CircleAvatar(
              radius: 78,
              backgroundColor: Colors.pink,
              child: CircleAvatar(
                radius: 78,
                backgroundColor: Colors.deepPurpleAccent.withBlue(120),
              ),
            ),
          ),
        ),
        Positioned(
          top: 57,
          right: 28,
          child: Transform(
            alignment: Alignment.center,
            transform:
                Matrix4.rotationX(0.14), // Rotate 180 degrees (π radians)
            child: CircleAvatar(
              radius: 76,
              backgroundImage: AssetImage(
                  "assets/images/me.jpg"), // Use backgroundImage instead of child
            ),
          ),
        ),
        Positioned(
            left: 20,
            bottom: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Im,',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.ubuntu(
                    fontSize: 28,
                    fontWeight: FontWeight.w200,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
                Text(
                  ' Kayode \n W. Olalere',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.ubuntu(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    color: Colors.white,
                  ),
                )
              ],
            )),
        Positioned(
          bottom: 20,
          right: 20,
          child: CircleAvatar(
            radius: 30,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.pink,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 25,
            left: 20,
            child: Row(
              children: [
                Text(
                  'williamsamson036@gmail.com',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 12,
                ),
              ],
            )),
        Positioned(
            bottom: 18,
            left: 20,
            child: Row(
              children: [
                Text(
                  '.........................',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: Colors.white,
                    letterSpacing: 4
                  ),
                ),

              ],
            )),
      ],
    );
  }
}

class RoundedTopLeftSlantedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Top-left rounded corner
    path.moveTo(-10, -30);
    path.quadraticBezierTo(0, 0, 0, 20);

    // Bottom-left slanted edge
    path.lineTo(30, size.height * 0.6); // Start of the slant
    path.lineTo(size.width * 0.4, size.height); // End of the slant

    // Bottom-right corner
    path.lineTo(size.width, size.height);

    // Top-right corner
    path.lineTo(size.width, 0);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CircularTextRing extends StatelessWidget {
  final String text;
  final double radius;

  const CircularTextRing({super.key, required this.text, this.radius = 100});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(text.length, (index) {
        double angle = (2 * pi / text.length) * index;
        return Positioned(
          left: radius + radius * cos(angle),
          top: radius + radius * sin(angle),
          child: Transform.rotate(
            angle: angle + pi / 2, // Adjust orientation
            child: Text(
              text[index],
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }),
    );
  }
}
