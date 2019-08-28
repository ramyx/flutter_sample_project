import 'package:flutter/widgets.dart';
import 'package:flutter_sample_project/models/user.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier{
  Status _status = Status.Unauthenticated;
  User _user;
  // SignIn _signIn;
  
  Status get status => _status;
  User get user => _user;

  UserRepository.instance();// empty constructor

  Future<bool> signIn(String email, String password) async {
    // fake values @FIXMI
    if(email == 'fake@email.com' && password == 'fakepass') {
      _status = Status.Authenticating;
      notifyListeners();
      return true;
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

  Future<void> _onAuthStateChanged(User user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}