import 'package:flutter/material.dart';

class ShopItem {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final double price;

  const ShopItem(
    this.id,
    this.name,
    this.description,
    this.icon,
    this.price,
  );
}

const mockItems = [
  ShopItem(
    "BBALL",
    "Basket ball",
    "Best basketball in the world, 100% rubber",
    Icons.sports_baseball,
    10.00,
  ),
  ShopItem(
    "TRAK",
    "Tennis racket",
    "A racket? this is amazing!",
    Icons.sports_tennis,
    20.00,
  ),
  ShopItem(
    "FBALL",
    "Football",
    "American's favorite",
    Icons.sports_football,
    15.00,
  ),
  ShopItem(
    "SBALL",
    "Soccer ball",
    "Italian's favorite",
    Icons.sports_soccer,
    10.00,
  ),
  ShopItem(
    "VBALL",
    "Volley ball",
    "???'s favorite",
    Icons.sports_volleyball,
    10.00,
  ),
];
