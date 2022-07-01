import 'package:flutter/material.dart';

class TrainingShopViewPage extends StatefulWidget {
  @override
  _TrainingShopViewState createState() => _TrainingShopViewState();
}

class _TrainingShopViewState extends State<TrainingShopViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Shop'),
      ),
      body: Center(
        child: Text('Training Shop'),
      ),
    );
  }
}
