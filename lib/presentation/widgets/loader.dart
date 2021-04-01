import 'package:flutter/material.dart';

class LoaderComponent extends StatelessWidget {
  const LoaderComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Text(
              '  Loading...',
            ),
          ],
        ),
      );
}
