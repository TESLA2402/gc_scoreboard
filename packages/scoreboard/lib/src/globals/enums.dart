import 'package:flutter/material.dart';

enum ApiResponse { success, adminRelogin }

enum Competitions {
  spardha("Spardha", "assets/spardha2.svg"),
  kriti("Kriti", "assets/kriti2.svg"),
  manthan("Manthan", "assets/manthan2.svg"),
  gc("GC", "assets/gc.svg");

  final String name;
  final String assetPath;
  const Competitions(this.name, this.assetPath);
}

enum ViewType { user, admin }

enum Pages {
  standings("Standings", Icons.trending_up_outlined),
  schedule("Schedule", Icons.date_range_outlined),
  results("Results", Icons.emoji_events_outlined);

  final String name;
  final IconData icon;
  const Pages(this.name, this.icon);
}

enum Category {
  men("Men"),
  women("Women"),
  menandwomen("Men + Women");

  final String categoryName;
  const Category(this.categoryName);
}

enum Hostel {
  overall("Overall"),
  brahmaputra("Brahmaputra"),
  kameng("Kameng");

  final String hostelName;
  const Hostel(this.hostelName);
}
