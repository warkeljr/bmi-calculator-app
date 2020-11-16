import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bmi_calculator_app/models/bmi.dart';
import 'package:bmi_calculator_app/components/list/bmi-tile.dart';


class BmiList extends StatefulWidget {
  @override
  _BmiListState createState() => _BmiListState();
}

class _BmiListState extends State<BmiList> {
  @override
  Widget build(BuildContext context) {

    final bmiHistory = Provider.of<List<Bmi>>(context);

    return ListView.builder(
      itemCount: bmiHistory.length,
      itemBuilder: (context, index) {
        return BmiTile(bmi: bmiHistory[index]);
      },
    );
  }
}