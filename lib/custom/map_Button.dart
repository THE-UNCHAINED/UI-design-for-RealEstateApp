import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;
  const MapButton(
      {Key? key,
      required this.iconData,
      required this.text,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: color),
          onPressed: () {},
          child: Container(
            height: 50,
            margin: EdgeInsets.all(4),
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: Colors.white70,
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          )),
    );
  }
}
