import 'package:flutter/material.dart';
import 'package:flutter_sample_project/models/user.dart';
import 'package:flutter_sample_project/providers/user_repository.dart';
import 'package:provider/provider.dart';

class UserInfoPage extends StatelessWidget {
  final User user;

  const UserInfoPage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user.email),
            Text(user.name),
            Text(user.gender),
            Text(user.age.toString()),
            RaisedButton(
              child: Text("SIGN OUT"),
              onPressed: () => Provider.of<UserRepository>(context).signOut(),
            )
          ],
        ),
      ),
    );
  }
}