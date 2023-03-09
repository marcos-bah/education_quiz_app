import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final IconData icon;
  final String label, result;
  final Color color;
  const ResultWidget({
    super.key,
    required this.icon,
    required this.result,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xffEDE8E3),
              child: Icon(
                icon,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 160,
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        Text(
          result,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w300,
                color: color,
              ),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
