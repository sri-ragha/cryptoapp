import 'package:crypto_app/Pages/crypto_list.dart';
import 'package:crypto_app/Pages/crypto_news.dart';
import 'package:crypto_app/Pages/homepage.dart';
import 'package:crypto_app/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const CryptoList(),
    const CryptoNews(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Cblack,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        iconSize: 20,
        currentIndex: currentIndex,
        selectedLabelStyle: const TextStyle(
          color: Cgreen,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedItemColor: Cwhite.withOpacity(0.3),
        selectedItemColor: Cgreen,
        unselectedLabelStyle: GoogleFonts.poppins(
          color: Cwhite.withOpacity(0.3),
          fontSize: 11,
        ),
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: Cwhite.withOpacity(0.3),
              size: 20,
            ),
            activeIcon: const Icon(
              CupertinoIcons.home,
              color: Cgreen,
              size: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.list_bullet,
              color: Cwhite.withOpacity(0.3),
              size: 20,
            ),
            activeIcon: const Icon(
              CupertinoIcons.list_bullet,
              color: Cgreen,
              size: 20,
            ),
            label: 'Crypto',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.news,
              color: Cwhite.withOpacity(0.3),
              size: 20,
            ),
            activeIcon: const Icon(
              CupertinoIcons.news,
              color: Cgreen,
              size: 20,
            ),
            label: 'News',
          ),
        ],
      ),
    );
  }
}
