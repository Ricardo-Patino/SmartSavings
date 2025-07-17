import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class SmartSavingsProyectoAuthUser {
  SmartSavingsProyectoAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SmartSavingsProyectoAuthUser>
    smartSavingsProyectoAuthUserSubject =
    BehaviorSubject.seeded(SmartSavingsProyectoAuthUser(loggedIn: false));
Stream<SmartSavingsProyectoAuthUser> smartSavingsProyectoAuthUserStream() =>
    smartSavingsProyectoAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
