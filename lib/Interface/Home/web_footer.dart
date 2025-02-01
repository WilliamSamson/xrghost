import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WebsiteFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Company Name & Branding
          Text(
            "© 2006-2025 WS-TECH, Inc. All Rights Reserved.",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 10),

          // Trademarks & Legal Notice
          Text(
            "WS-TECH™, G.H.O.S.T™, and Co Software's™ are registered trademarks of WS-TECH, Inc. "
                "and may only be used with explicit written permission.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.grey.shade400,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 20),

          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              _buildSocialIcon(FontAwesomeIcons.twitter),
              _buildSocialIcon(FontAwesomeIcons.instagram),
              _buildSocialIcon(FontAwesomeIcons.linkedinIn),
              _buildSocialIcon(FontAwesomeIcons.github),
            ],
          ),

          const SizedBox(height: 15),

          // Footer Links
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            children: [
              _buildFooterLink("Privacy Policy"),
              _buildFooterLink("Terms of Service"),
              _buildFooterLink("Cookie Policy"),
              _buildFooterLink("Support"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {}, // Add navigation link
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.blueAccent,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
