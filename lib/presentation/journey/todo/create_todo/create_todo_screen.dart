import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/injector/injector.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';

class CreateTodoScreen extends StatefulWidget {
  CreateTodoScreen({
    Key key,
  }) : super(key: key);

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  TextEditingController controller;
  TodoBloc bloc;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    bloc = Injector.resolve<TodoBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedToDo() {
    bloc.add(AddTodoEvent(description: controller.text));
  }

  @override
  Widget build(BuildContext context) => BlocProvider<TodoBloc>(
        create: (context) => bloc,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Create Todo'),
            centerTitle: true,
          ),
          body: BlocListener(
            bloc: bloc,
            listener: mapStateListner,
            child: BlocBuilder(
              bloc: bloc,
              builder: mapStateToWidget,
            ),
          ),
        ),
      );

  Widget mapStateToWidget(context, state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (String val) => setState(() {}),
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter the todo'),
            ),
            ElevatedButton(
              child: Text('Add todo'),
              onPressed:
                  controller.text.length > 0 ? () => onPressedToDo() : null,
            )
          ],
        ),
      );

  void mapStateListner(context, state) {
    if (state is UpdatedList) {
      Navigator.of(context).pop();
    }
  }
}
