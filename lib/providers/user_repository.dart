import 'package:flutter/widgets.dart';
import 'package:flutter_sample_project/models/user.dart';

enum Status { Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  Status _status = Status.Unauthenticated;
  User _user = new User("Ramiro", "fake@email.com", "male", 28);

  Status get status => _status;
  User get user => _user;

  Future<bool> signIn(String email, String password) async {
    // fake values @FIXMI
    if (email == 'fake@email.com' && password == 'fakepass') {
      _status = Status.Authenticating;
      notifyListeners();
      Future.delayed(const Duration(seconds: 3), () {
        _status = Status.Authenticated;
        notifyListeners();
        return true;
      });
    } else {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero); // need for type return
  }
}
