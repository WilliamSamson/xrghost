import 'package:flutter/material.dart';
import 'package:xrghost/core/imports.dart';

import 'package:xrghost/core/constants/app_colors.dart';
import 'package:xrghost/core/utils/responsive.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenType = context.screenType;
    final isMobile = screenType == ScreenType.mobile;
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 32,
          vertical: isMobile ? 24 : 32,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Navigation Rail
            if (!isMobile) _buildNavigationRail(context),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  _buildHeaderSection(context, theme),

                  const SizedBox(height: 40),

                  // Stats Grid
                  _buildStatsGrid(context),

                  const SizedBox(height: 40),

                  // Team Section
                  _buildTeamSection(context),

                  const SizedBox(height: 40),

                  // Charts Section
                  _buildChartsSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
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

  Widget _buildHeaderSection(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Building digital products,\nbrands, and experience.',
          style: theme.textTheme.headlineLarge?.copyWith(
            fontSize: context.responsiveValue(
              mobile: 28,
              tablet: 36,
              desktop: 42,
            ),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Collaborate with brands and agencies\nto create impactful results.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount:
          context.responsiveValue(mobile: 2, tablet: 3, desktop: 3).toInt(),
      childAspectRatio: 1.2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: const [
        _StatCard(number: '251', label: 'Projects'),
        _StatCard(number: '156', label: 'Clients'),
        _StatCard(number: '172', label: 'Collaborations'),
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
            _TeamMember(name: 'Jon', role: 'Lead Developer'),
            _TeamMember(name: 'Daniel', role: 'Creative Director'),
          ],
        ),
      ],
    );
  }

  Widget _buildChartsSection(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(24),
      child: const Placeholder(), // Replace with actual chart implementation
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
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;

  const _StatCard({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: GoogleFonts.ubuntu(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
          ),
        ],
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
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
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
        ],
      ),
    );
  }
}
