import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BmiList extends StatefulWidget {
  @override
  _BmiListState createState() => _BmiListState();
}

class _BmiListState extends State<BmiList> {
  @override
  Widget build(BuildContext context) {

    final bmiHistory = Provider.of<QuerySnapshot>(context);

    // print(bmiHistory.documents);

    for (var doc in bmiHistory.documents) {
      print(doc.data);
    }

    return Container(
      
    );
  }
}