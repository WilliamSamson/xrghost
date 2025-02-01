import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:xrghost/Interface/Home/profile.dart';
import 'package:xrghost/core/imports.dart';
import 'package:google_fonts/google_fonts.dart';

import 'file_design.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Navigation Rail
            _buildNavigationRail(context),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTop(context),
                    _buildHeaderSection(context),
                    const SizedBox(height: 40),
                    // Team Section
                    _buildTeamSection(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileCard(),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Portfolio',
                style: GoogleFonts.ubuntu(
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 350, // Ensures the width is constrained
                height: 300, // Adjust based on the required height
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StaggeredGrid.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: const [
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 2,
                        child: _StatCards(
                          number: '20+',
                          label: 'Projects',
                          color: Colors.blue,
                        ),
                      ),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 1,
                        child: _StatCards(
                          number: '10+',
                          label: 'Clients',
                          color: Colors.green,
                        ),
                      ),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 2,
                        child: _StatCards(
                          number: '3',
                          label: 'Won Hackathons',
                          color: Colors.orange,
                        ),
                      ),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 1,
                        child: _StatCards(
                          number: '3',
                          label: 'Collabs',
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationRail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: RotatedBox(
        quarterTurns: -1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavItem(title: 'Channel', onTap: () {}),
            _NavItem(title: 'Portfolio', onTap: () {}),
            _NavItem(title: 'Research', onTap: () {}),
            _NavItem(title: 'Clients', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Building digital products,\nbrands, and experience.',
          style: GoogleFonts.ubuntu(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Collaborate with brands and agencies\nto create impactful results.',
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildTeamSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Core Team',
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: const [
            _TeamMember(name: 'Kayode', role: 'Lead Developer'),
            _TeamMember(name: 'Fikayo', role: 'Flutter Dev'),
            _TeamMember(name: 'Tega', role: 'A.I Dev'),
          ],
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            title,
            style: GoogleFonts.ubuntu(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCards extends StatelessWidget {
  final String number;
  final String label;
  final Color color;

  const _StatCards({
    super.key,
    required this.number,
    required this.label,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(number,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text(label,
                style: const TextStyle(fontSize: 16, color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}

class _TeamMember extends StatelessWidget {
  final String name;
  final String role;

  const _TeamMember({required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.ubuntu(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: GoogleFonts.ubuntu(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
