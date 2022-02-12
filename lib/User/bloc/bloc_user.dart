import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:hermes_app/repository/auth.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  Future<void> signIn(String email, String password) async {
    //get google signin after validate with pool users
    try {} on Exception {
      rethrow;
    }
  }

  signOut() {}

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
