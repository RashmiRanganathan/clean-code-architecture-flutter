import 'package:flutter/material.dart';

class SwipeLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.green,
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.check),
            Text(
              'Complete',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
