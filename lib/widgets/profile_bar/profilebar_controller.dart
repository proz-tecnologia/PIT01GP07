import 'package:teste/widgets/profile_bar/profilebar_repository.dart';

class ProfileBarController {
  static final ProfileBarController instance = ProfileBarController();

  ProfileBarRepository repository = ProfileBarRepository();

  Future<String?> userName(String userEmail) async {
    String? userName = repository.getUserName(userEmail);
    return userName;
  }
}
