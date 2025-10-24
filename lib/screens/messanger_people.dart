import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class MessangerPeople extends StatelessWidget {
  const MessangerPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _TopBar(),
            const _SearchBar(),
            Expanded(
              child: ListView(
                children: [
                  const _YourStoryTile(),
                  _PersonTile(
                    name: 'Martha Craig',
                    imagePath: 'assets/images/318_216.png',
                    isOnline: true,
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                  const _Divider(),
                  _PersonTile(
                    name: 'Kieron Dotson',
                    imagePath: 'assets/images/318_240.png',
                    status: '8 min.',
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                  const _Divider(),
                  _PersonTile(
                    name: 'Zack John',
                    imagePath: 'assets/images/318_254.png',
                    status: '10 min.',
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                  const _Divider(),
                  _PersonTile(
                    name: 'Jamie Franco',
                    imagePath: 'assets/images/318_228.png',
                    isOnline: true,
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                  const _Divider(),
                  _PersonTile(
                    name: 'Tabitha Potter',
                    imagePath: 'assets/images/318_268.png',
                    status: '10 min.',
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                  const _SectionHeader(title: 'RECENTLY ACTIVE'),
                  _PersonTile(
                    name: 'Albert Lasker',
                    imagePath: 'assets/images/318_283.png',
                    status: '30 min.',
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _CustomBottomNavBar(),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar();

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 86,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            border: Border(
              top: BorderSide(color: Colors.grey.shade300, width: 0.5),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.chat_bubble,
                  isActive: currentPath == '/messanger_swipe_actions',
                  onTap: () {
                    if (currentPath != '/messanger_swipe_actions') {
                      context.go('/messanger_swipe_actions');
                    }
                  },
                ),
                _buildNavItem(
                  icon: Icons.people,
                  isActive: currentPath == '/messanger_people',
                  onTap: () {
                     if (currentPath != '/messanger_people') {
                      context.go('/messanger_people');
                    }
                  },
                ),
                _buildNavItem(
                  icon: Icons.explore_outlined,
                  isActive: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    final color = isActive ? Colors.black : Colors.grey;
    return IconButton(
      icon: Icon(icon, color: color, size: 28),
      onPressed: onTap,
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.6),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/318_319.png'),
              ),
              const SizedBox(width: 8),
              Text(
                'People',
                style: GoogleFonts.sourceSansPro(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              _CircularIconButton(
                icon: Icons.chat_bubble_outline,
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              _CircularIconButton(
                icon: Icons.person_add_alt_1,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _CircularIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 22),
        onPressed: onPressed,
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.6),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: GoogleFonts.sourceSansPro(
            color: const Color(0xFF8E8E93),
            fontSize: 17,
          ),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF8E8E93)),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

class _YourStoryTile extends StatelessWidget {
  const _YourStoryTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add, color: Colors.black),
      ),
      title: Text(
        'Your story',
        style: GoogleFonts.sourceSansPro(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        'Add to your story',
        style: GoogleFonts.sourceSansPro(
          fontSize: 13,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}

class _PersonTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isOnline;
  final String? status;
  final VoidCallback onTap;

  const _PersonTile({
    required this.name,
    required this.imagePath,
    this.isOnline = false,
    this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(imagePath),
          ),
          if (isOnline)
            Positioned(
              right: -2,
              bottom: -2,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: const Color(0xFF5AD439),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ),
          if (status != null)
            Positioned(
              left: 2,
              bottom: -6,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: const Color(0xFFC7F0BA),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Text(
                  status!,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        name,
        style: GoogleFonts.sourceSansPro(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.07),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.waving_hand_outlined, size: 16),
          onPressed: () {},
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 0.5,
      indent: 80,
      color: Colors.black.withOpacity(0.12),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Text(
        title,
        style: GoogleFonts.sourceSansPro(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.34),
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}