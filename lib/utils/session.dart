import 'package:tablylink/models/user.dart';

class Session {
  Session._();
  static final Session instance = Session._();
  AppUser? currentUser;
  bool get isLoggedIn => currentUser != null;

}
