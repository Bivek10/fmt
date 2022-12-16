import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ButtonText extends StatelessWidget {
  const ButtonText(
      {super.key,
      required this.onPressEvent,
      required this.btnName1,
      required this.style1,
      required this.btnName,
      required this.style,
      this.alignment = Alignment.center});

  final Function onPressEvent;
  final String btnName;
  final TextStyle style;
  final String btnName1;
  final TextStyle style1;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: () {
          onPressEvent();
        },
        child: Text.rich(
          TextSpan(
            text: btnName,
            style: style,
            children: [
              TextSpan(
                text: btnName1,
                style: style1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
