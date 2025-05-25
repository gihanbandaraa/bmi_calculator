import 'package:flutter/material.dart';
import 'constants.dart';

class GenderTileWidget extends StatelessWidget {
  final bool isMale;
  final Function onTap;
  final String text;
  final IconData icon;

  const GenderTileWidget({
    super.key,
    required this.onTap,
    required this.isMale,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration:
            isMale ? kSelectedTileBorderDecoration : kTileBorderDecoration,
        child: Column(children: [
          Icon(
            icon,
            size: 50,
            color: kActiveTextColor,
          ),
          Text(text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kActiveTextColor,
              )),
        ]),
      ),
    );
  }
}
