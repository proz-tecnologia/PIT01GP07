import 'package:flutter/material.dart';
import '../pages/homescreen/homescreen_controller.dart';
import '../pages/login/login.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  HomeScreenController controller = HomeScreenController();
  bool darkTheme = false;
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary),
                    accountName: Text(
                      'Thalia Bôto',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    accountEmail: Text(
                      'thaliaboto@gmail.com',
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    currentAccountPicture: const CircleAvatar(
                      child: ClipOval(),
                    ),
                  ),
                  SwitchListTile(
                    title: Text('Tema Escuro',
                        style: Theme.of(context).textTheme.bodyText1),
                    secondary: Icon(Icons.dark_mode,
                        color: Theme.of(context).colorScheme.tertiary),
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    inactiveThumbColor: Colors.grey,
                    value: darkTheme,
                    onChanged: (bool value) {
                      setState(() {
                        darkTheme = value;
                      });
                    }, // trailing:,
                  ),
                  SwitchListTile(
                    title: Text('Notificações',
                        style: Theme.of(context).textTheme.bodyText1),
                    secondary: Icon(Icons.notifications,
                        color: Theme.of(context).colorScheme.tertiary),
                    value: notifications,
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    inactiveThumbColor: Colors.grey,
                    onChanged: (bool value) {
                      setState(() {
                        notifications = value;
                      });
                    },
                  ),
                  ListTile(
                    title: Text('Editar Conta',
                        style: Theme.of(context).textTheme.bodyText1),
                    leading: Icon(Icons.manage_accounts,
                        color: Theme.of(context).colorScheme.tertiary),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Configurações',
                        style: Theme.of(context).textTheme.bodyText1),
                    leading: Icon(Icons.settings,
                        color: Theme.of(context).colorScheme.tertiary),
                    onTap: () {},
                  ),
                  const Divider(),
                ],
              ),
            ),
            ListTile(
              tileColor: Theme.of(context).colorScheme.secondary,
              title: Text('Encerrar Sessão',
                  style: Theme.of(context).textTheme.overline),
              leading: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.tertiary),
              onTap: logout,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    bool? logout = await controller.logout();
    if (logout!) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          behavior: SnackBarBehavior.floating,
          content: Text("Não é possivel fazer logout. Erro no Servidor!"),
        ),
      );
    }
  }
}
