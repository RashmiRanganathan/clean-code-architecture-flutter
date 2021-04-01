import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  final String text;
  final TodoEntity state;
  final Function (bool) update;

  const TodoCard({
    Key key,
    this.text,
    this.state, 
    this.update
  }) : super(key: key);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _click;
  @override
  void initState() {
    super.initState();
    _click = widget.state.completed??false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            children: [
              SizedBox(width: 10),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _click = !_click;
                      widget.update(_click);
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
                    fontSize: 16.0,
                    height: 1,
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