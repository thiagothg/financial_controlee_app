import 'package:financial_controlee_app/app/data/model/auth_model.dart';
import 'package:financial_controlee_app/app/data/model/user_model.dart';
import 'package:financial_controlee_app/app/global/core/services/gql_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GraphQLClient _gqlClient;

  AuthProvider(this._gqlClient);

  Stream<Auth?> get authStatus => auth.authStateChanges().map((user) {
        if (user != null) {
          var auth = Auth(
            expiresIn: 0,
            accessToken: user.refreshToken!,
            tokenType: '${user.tenantId}',
            user: UserModel(
                id: user.uid,
                name: user.displayName ?? '',
                email: user.email ?? '',
                urlImage: user.photoURL),
          );
          return auth;
        }
      });

  ///
  Future<UserModel?> signup(String email, String password) async {
    try {
      var credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await credential.user!.sendEmailVerification();

      credential.user?.updateDisplayName(email.substring(0, 1));
      credential.user?.reload();

      // userRepository

      return UserModel(
          id: credential.user!.uid,
          name: credential.user!.displayName!,
          email: email,
          urlImage: credential.user!.photoURL!);
    } on FirebaseAuthException catch (e) {
      print('${e.message} - ${e.toString()}');
      var message = 'error';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      rethrow;
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  ///
  Future<UserModel?> login(String email, String password) async {
    try {
      var credential = await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      return UserModel(
          id: credential.user!.uid,
          name: credential.user!.displayName!,
          email: email,
          urlImage: credential.user!.photoURL!);
    } on FirebaseAuthException catch (e) {
      print('${e.message} - ${e.toString()}');

      var message = 'erro';

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ///
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  ///
  Future<UserModel?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final googleAuth = await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await userCredential.user!.sendEmailVerification();

      return UserModel(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          urlImage: userCredential.user!.photoURL!);
    } catch (e) {
      print(e.toString());
    }
  }
}
