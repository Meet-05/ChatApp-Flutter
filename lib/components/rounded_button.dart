import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final Color colour;
  final Function onTap;

  RoundedButton(
      {@required this.colour, @required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour, //Colors.lightBlueAccent
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
