import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final Text text1;
  final Text text2;

  const TodoCard({Key key, this.text1, this.text2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: text1,
            ),
            Flexible(child: text2)
          ],
        ),
      ),
    );
  }
}
