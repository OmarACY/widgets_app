import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/router/app_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void _showCustomSnackbar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    var snackbar = SnackBar(
        content: const Text('Hola mundo!'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(label: 'Ok!',onPressed: () {},
        ),
      );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      body: const _SnackbarView(),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => _showCustomSnackbar(context),
      ),
    );
  }
}

class _SnackbarView extends StatelessWidget {
  const _SnackbarView();

    void openDialog( BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Estás seguro?'),
          content: const Text('Incididunt dolore dolor sit esse ipsum. Quis ad dolore eiusmod quis sunt dolor. Deserunt anim ex cillum enim laboris veniam velit proident reprehenderit laboris. Officia amet ullamco irure id et id.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
            FilledButton(
              onPressed: () => context.pop(),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FilledButton.tonal(onPressed:
          () {
            showAboutDialog(context: context,
            children: const <Widget>[
              Text('Este es un diálogo de prueba, consequat aliqua ex reprehenderit aute officia. Eiusmod dolore duis cillum fugiat ut amet magna. Quis ad proident cillum anim cillum laborum nisi ad occaecat occaecat labore culpa. Sunt aliquip cillum proident cupidatat officia deserunt. Ea incididunt pariatur reprehenderit labore non irure elit esse in proident. Exercitation tempor qui dolor ex laboris incididunt proident ex sint duis esse dolor. Officia culpa sint eu voluptate ipsum deserunt do.'),
            ],
            );
          }, child: const Text('Licencias usadas')),
          FilledButton.tonal(onPressed:
          () {
            openDialog(context);
          }, child: const Text('Mostrar diálogo')),
        ],
      ),
    );
  }
}