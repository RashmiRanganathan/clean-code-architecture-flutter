import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  final String text;

  const TodoCard({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _click;
  @override
  void initState() {
    super.initState();
    _click = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 50,
          child: Row(
            children: [
              SizedBox(width: 10),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _click = !_click;
                    });
                  },
                  child: Icon(
                    _click
                        ? Icons.check_circle_rounded
                        : Icons.check_circle_outline_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 30),
              Flexible(
                  child: Text(
                widget.text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: _click
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
