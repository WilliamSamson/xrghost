import 'package:flutter/material.dart';

class FileIconCard extends StatelessWidget {
  final String title;
  final double width;
  final double height;

  const FileIconCard({
    super.key,
    required this.title,
    this.width = 150,
    this.height = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main card body
          _buildCardBody(),

          // Folded corner effect
          Positioned(
            top: 0,
            right: 0,
            child: _buildFoldedCorner(),
          ),

          // Title tab
          Positioned(
            top: 0,
            left: 0,
            right: 20, // Account for folded corner
            child: _buildTitleTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildCardBody() {
    return ClipPath(
      clipper: _FileIconClipper(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.red[800]!,
              Colors.red[900]!,
            ],
          ),
          border: Border.all(
            color: Colors.red[900]!.withOpacity(0.8),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.red[900]!.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              begin: Alignment(-0.8, -0.8),
              end: Alignment(0.8, 0.8),
              colors: [
                Colors.white.withOpacity(0.15),
                Colors.transparent,
                Colors.white.withOpacity(0.05),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleTab() {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: Colors.red[400]!.withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 2,
                offset: const Offset(1, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoldedCorner() {
    return ClipPath(
      clipper: _CornerClipper(),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.red[200]!.withOpacity(0.9),
          border: Border(
            left: BorderSide(
              color: Colors.red[900]!.withOpacity(0.3),
              width: 1.5,
            ),
            bottom: BorderSide(
              color: Colors.red[900]!.withOpacity(0.3),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _FileIconClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width - 20, 0)
      ..lineTo(size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _CornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}