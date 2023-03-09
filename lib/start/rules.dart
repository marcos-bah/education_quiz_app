import 'package:flutter/material.dart';

class RulesWidget extends StatelessWidget {
  final String text, description;
  final String? text2;
  final Color color;
  const RulesWidget(
      {super.key,
      required this.text,
      this.text2,
      required this.color,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.bodyText2,
            children: [
              TextSpan(
                text: text2,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: color,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 140,
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w300,
                  color: color,
                ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
