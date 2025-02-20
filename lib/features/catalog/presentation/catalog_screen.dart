import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('catalog')),
        body: Container(
          color: Colors.black54,
          child: ListView.builder(
            itemCount: 25,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                'Что вершит судьбу человечества в этом мире?',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
        ),
    );
  }
}