import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LinearLoading extends StatelessWidget {
  final bool isLoading;

  LinearLoading(this.isLoading);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: this.isLoading
          ? Column(children: [
              LinearProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.green.shade200),
                minHeight: 5.0,
                backgroundColor: Colors.green.shade500,
              )
            ])
          : SizedBox(width: 0, height: 0),
    );
  }
}
