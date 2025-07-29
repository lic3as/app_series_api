import 'package:flutter_app3_series/custom_drawer.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;

  const BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end, // Alinha à direita
          children: [Text('Eu Amo Séries 🎬')],
        ),
      ),
      drawer: CustomDrawer(),
      body: child,
    );
  }
}
