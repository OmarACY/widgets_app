import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(this.title, this.subTitle, this.link, this.icon);
}

const appMenuItems = <MenuItem>[
  MenuItem('Botones', 'Varios botones en Flutter', '/buttons',
      Icons.smart_button_outlined),
  MenuItem('Tarjetas', 'Un contenedor estilizado', '/cards', Icons.credit_card),
  MenuItem('ProgressIndicators', 'Generales y controlados', '/progress', Icons.refresh_rounded)
];
