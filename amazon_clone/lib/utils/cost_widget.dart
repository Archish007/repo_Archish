import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  final double? cost;
  const CostWidget({super.key,required this.cost});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "₹",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontFeatures: [
              FontFeature.superscripts(),
            ],
          ),
        ),
        Text(
          cost!.toInt().toString(),
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          (cost! - cost!.truncate()).toString(),
          style: const TextStyle(
            fontSize: 10,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}