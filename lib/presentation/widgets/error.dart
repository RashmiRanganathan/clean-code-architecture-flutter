import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  final String errorMessage;
  final Function onRetryPressed;

  const ErrorComponent({
    Key key,
    this.errorMessage,
    this.onRetryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(errorMessage),
            SizedBox(height: 8),
            RaisedButton(
              child: Text('Retry'),
              onPressed: onRetryPressed,
            )
          ],
        ),
      );
}
