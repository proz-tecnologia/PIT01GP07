import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste/pages/login/login_model.dart';
import 'package:teste/pages/login/login_repository.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

void main() {
  late FirebaseAuthMock firebaseAuthMock;

  late UserCredentialMock userCredentialMock;

  late UserMock user;

  late LoginRepository repository;

  setUpAll(() {
    firebaseAuthMock = FirebaseAuthMock();
    repository = LoginRepository(firebaseAuthMock);
    userCredentialMock = UserCredentialMock();
    user = UserMock();
  });

  group('Login Test', () {
    final userModel = LoginModel(email: 'test@test.com', password: 'test123');
    final userModelFake =
        LoginModel(email: 'testfake@test.com', password: 'test123');
    test('Checking User Success', () async {
      // Test successful login
      when(
        (() => firebaseAuthMock.signInWithEmailAndPassword(
            email: userModel.email, password: userModel.password)),
      ).thenAnswer((_) async => userCredentialMock);
      when((() => userCredentialMock.user)).thenReturn(user);
      final check = await repository.checkingUser(userModel);
      expect(check, 'Success');
    });
    test('Checking User error', () async {
      // Test error login
      when(
        (() => firebaseAuthMock.signInWithEmailAndPassword(
            email: userModel.email, password: userModel.password)),
      ).thenAnswer((_) async => userCredentialMock);
      when((() => userCredentialMock.user)).thenReturn(null);
      final check = await repository.checkingUser(userModelFake);
      expect(check, 'error');
    });
  });
}
