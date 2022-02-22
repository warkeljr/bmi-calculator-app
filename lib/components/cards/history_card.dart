import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/models/bmi.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class BmiHistoryCard extends StatelessWidget {
  final Bmi _bmi;

  BmiHistoryCard(this._bmi);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Padding(padding: EdgeInsets.all(20.0),
        child: Slidable(
          key: ValueKey(0),
          endActionPane: ActionPane(
            motion: DrawerMotion(),
            dismissible: DismissiblePane(onDismissed: () {}),
            children: [
               SlidableAction(
        onPressed: null,
        backgroundColor: Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
      ),
      SlidableAction(
        onPressed: null,
        backgroundColor: Color(0xFF21B7CA),
        foregroundColor: Colors.white,
        icon: Icons.share,
        label: 'Share',
      ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 0.0)),
                  Text('${_bmi.bmiResultText}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  Spacer(),
                  Text('${_bmi.bmiResult}'),
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 0.0)),
                  Flexible(
                    child: Text('${_bmi.bmiInterpretation}',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,),
                  ),
                ],
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
