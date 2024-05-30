import 'package:flutter/material.dart';

class MenuItem {
final String title;
final String subTitle;
final String link;
final IconData icon;
final String image;

const MenuItem(
{required this.title,
required this.subTitle,
required this.link,
required this.icon,
required this.image});
}

const appMenuRestaurant = <MenuItem> [
  MenuItem(
    title: "Hamburguesas",
    subTitle: "Variedad de hamburguesas",
    link: '/hamburgers',
    icon: Icons.lunch_dining_rounded,
    image: 'assets/Hamburguesa Doble Carne.avif'),
  MenuItem(
    title: "Postres",
    subTitle: "Deliciosos Postres",
    link: '/desserts',
    icon: Icons.smart_button_outlined,
    image: 'assets/Helados Sabores.jpg'),

];