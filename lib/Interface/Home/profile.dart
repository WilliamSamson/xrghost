import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xrghost/core/imports.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 400,
      child: Stack(
        children: [
          _buildBackgroundElements(),
          _buildDecorationElements(),
          _buildDecorationElements(),
          _buildProfileImage(),
          _buildNameSection(),
          _buildContactInfo(),
          Positioned(
            bottom: 20,
            right: 30,
            child: Container(
              height: 120,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: const Placeholder(
                strokeWidth: 8,
              )
              , // Replace with actual chart implementation
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundElements() {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopContent(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.share_location, size: 20,color: Colors.white,),
          const SizedBox(width: 8),
          Text(
            'About Me',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Positioned(
      top: 50,
      right: 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildAvatarRing(),
          Transform.rotate(
            angle: 0.14,
            child: const CircleAvatar(
              radius: 76,
              backgroundImage: AssetImage("assets/images/me.jpg"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarRing() {
    return const CircleAvatar(
      radius: 85,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 78,
        backgroundColor: Colors.pink,
        child: CircleAvatar(radius: 78),
      ),
    );
  }

  Widget _buildNameSection() {
    return Positioned(
      left: 20,
      bottom: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'I`m,',
            style: _nameTextStyle(fontWeight: FontWeight.w200),
          ),
          Text(
            'Kayode\nW. Olalere',
            style: _nameTextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  TextStyle _nameTextStyle({FontWeight? fontWeight}) {
    return GoogleFonts.ubuntu(
      fontSize: 32,
      fontWeight: fontWeight,
      height: 1.2,
      color: Colors.white,
    );
  }

  Widget _buildContactInfo() {
    return Positioned(
      bottom: 12,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmailRow(),
          _buildDottedLine(),
        ],
      ),
    );
  }

  Widget _buildEmailRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'williamsamson036@gmail.com',
          style: GoogleFonts.ubuntu(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 4),
        const Icon(Icons.email, size: 12, color: Colors.white),
      ],
    );
  }

  Widget _buildDottedLine() {
    return Text(
      '.........................',
      style: GoogleFonts.ubuntu(
        fontSize: 10,
        letterSpacing: 4,
        color: Colors.white,
      ),
    );
  }

  Widget _buildStatusIndicator() {
    return const Align(
      alignment: Alignment.centerRight,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
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
    );
  }

  Widget _buildDecorationElements() {
    return Positioned(
      top: 20,
      right: 0,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationX(pi),
        child: ClipPath(
          clipper: _CardClipper(),
          child: Container(
            width: 220,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}

class _CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(16, 0)
      ..quadraticBezierTo(0, 0, 0, 16)
      ..lineTo(0, size.height * 0.6)
      ..lineTo(size.width * 0.4, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
