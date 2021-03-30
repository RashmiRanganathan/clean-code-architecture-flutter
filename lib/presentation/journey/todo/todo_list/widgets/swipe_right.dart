import 'package:flutter/material.dart';

class SwipeRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.red,
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete),
            Text(
              'Delete',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
