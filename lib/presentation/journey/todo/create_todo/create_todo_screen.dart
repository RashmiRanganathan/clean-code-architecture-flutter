import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTodoScreen extends StatefulWidget {
  CreateTodoScreen({
    Key key,
  }) : super(key: key);

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  TextEditingController descriptionController;
  TodoBloc _todoBloc;


  @override
  void initState() {
    descriptionController = TextEditingController();
    _todoBloc = BlocProvider.of<TodoBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _todoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) => Scaffold(
        appBar: AppBar(
          title: Text('Create Todo'),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.of(context).pop();
          }),
        ),
        body: BlocConsumer<TodoBloc,TodoState>(
          bloc:_todoBloc,
          listener: (context,state){
            if(state is CreateTodoSuccess){
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.description),
                          labelText: 'description',
                        ),
                      )),
                  RaisedButton(
                      child: Text('create'),
                      onPressed: () {
                        print(descriptionController.text);
                        _todoBloc.add(CreateTodo(description: descriptionController.text));
                      })
                ],
              ),
            );
          }
        ),
      );
}
