import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste/pages/sign_up/sign_up_model.dart';
import 'package:teste/pages/sign_up/sign_up_repository.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class FirebaseFirestoreMock extends Mock implements FirebaseFirestore {}

class AuthCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

void main() {
  late SignUpRepository repository;
  late FirebaseAuthMock mockAuth;
  late FirebaseFirestoreMock mockDatabase;
  late AuthCredentialMock credential;

  setUp(() {
    mockAuth = FirebaseAuthMock();
    mockDatabase = FirebaseFirestoreMock();
    repository = SignUpRepository(mockAuth, mockDatabase);
    credential = AuthCredentialMock();
  });

  group('saveUser', (() {
    test('should return Success when create user account', () async {
      final user = SignUpModel(
        name: 'Teste',
        email: 'teste@test.com',
        password: 'test123',
      );

      when((() => credential.user)).thenReturn(UserMock());
      when((() => mockAuth.createUserWithEmailAndPassword(
            email: 'teste@test.com',
            password: 'test123',
          ))).thenAnswer((_) async => Future.value(credential));

      final result = await repository.saveUser(user);

      expect(result, 'Success');
    });

    test('should return error if email is already in use', () async {
      final user = SignUpModel(
        name: 'Teste',
        email: 'teste@test.com',
        password: 'test123',
      );

      when((() => mockAuth.createUserWithEmailAndPassword(
            email: 'teste@test.com',
            password: 'test123',
          ))).thenThrow(FirebaseAuthException(
        code: 'email-already-in-use',
        message: 'The account already exists for that email.',
      ));

      final result = await repository.saveUser(user);

      expect(result, 'The account already exists for that email.');
    });
  }));
}
