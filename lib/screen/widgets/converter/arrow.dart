import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArrowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.compare_arrows,
          size: 40.0,
        ));
  }

}