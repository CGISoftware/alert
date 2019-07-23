import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final BuildContext context;
  final String message;
  final Dialog dialog;
  final void Function(bool) onConfirm;

  Alert(
      {@required this.context, @required this.message, @required this.dialog, @required this.onConfirm});

  show() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => this.dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                this.message,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                    onPressed: () async {
                      onConfirm(true);
                      // await ordemBloc.deleteDB();
                      // await ordemBloc.getOrdens();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Sim!',
                      style: TextStyle(color: Colors.red, fontSize: 18.0),
                    )),
                FlatButton(
                    onPressed: () {
                      onConfirm(false);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Não!',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18.0),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
