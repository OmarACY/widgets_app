import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Un mensaje en pantalla'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Mostrar Snackbar'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Un diálogo'),
                    content: const Text('Contenido del diálogo'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Mostrar Diálogo'),
          ),
        ],
      ),
    );
  }
}