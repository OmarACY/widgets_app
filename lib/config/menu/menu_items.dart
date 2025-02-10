import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(this.title, this.subTitle, this.link, this.icon);
}

const appMenuItems = <MenuItem>[
  MenuItem('Counter Riverpod', 'Contador Riverpod', '/counter',Icons.add_circle_outline_rounded),
  MenuItem('Botones', 'Varios botones en Flutter', '/buttons',Icons.smart_button_outlined),
  MenuItem('Tarjetas', 'Un contenedor estilizado', '/cards', Icons.credit_card),
  MenuItem('Progress Indicators', 'Generales y controlados', '/progress', Icons.refresh_rounded),
  MenuItem('Snackbars y diálogos', 'Indicadores en pantalla', '/snackbars', Icons.info_outlined),
  MenuItem('Animated container', 'Stateful widget animado', '/animated', Icons.check_box_outline_blank_rounded),
  MenuItem('UI Controls + Tiles', 'Una serie de controles de Flutter', '/ui-controls', Icons.car_rental_outlined),
  MenuItem('Introduccion a la aplicacion', 'Pequeño tutorial introductorio', '/tutorial', Icons.accessible_rounded),
  MenuItem('InfiniteScroll and Pull', 'Listas infinitas y pull to refresh', '/infinite', Icons.list_alt_rounded),
];
