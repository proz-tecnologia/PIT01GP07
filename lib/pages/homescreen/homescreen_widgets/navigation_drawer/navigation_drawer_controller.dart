import 'navigation_drawer_repository.dart';

class NavigationDrawerController {
  NavigationDrawerRepository repository = NavigationDrawerRepository();

  Future<bool?> logout() async {
    String logout = await repository.logout();
    if (logout == 'success') {
      return true;
    } else if (logout == 'error') {
      return false;
    }
    return null;
  }
}
