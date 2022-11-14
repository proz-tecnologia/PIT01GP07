import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/styleapp.dart';
import '../../widgets/default_button/default_button.dart';
import 'sign_up_controller.dart';
import 'sign_up_model.dart';
import 'sign_up_states.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpController controller = SignUpController.instance;
  final _formKey = GlobalKey<FormState>();
  Icon icon = const Icon(Icons.visibility);
  Icon icon2 = const Icon(Icons.visibility);
  bool obscure = true;
  bool obscure2 = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassowrdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.state is SignUpErrorState) {
        final errorState = controller.state as SignUpErrorState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            behavior: SnackBarBehavior.floating,
            content: Text(errorState.message),
          ),
        );
      } else if (controller.state is SignUpSuccessState) {
        nameController.text = '';
        emailController.text = '';
        passwordController.text = '';
        confirmPassowrdController.text = '';
        final errorState = controller.state as SignUpSuccessState;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            behavior: SnackBarBehavior.floating,
            content: Text(errorState.message),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondBackgroudColor,
        appBar: AppBar(
          backgroundColor: AppColors.secondBackgroudColor,
          iconTheme: const IconThemeData(color: AppColors.backgroudColor),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      ' Cadastre-se',
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.backgroudColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.account_circle,
                      size: 100,
                      color: AppColors.backgroudColor,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nome obrigatório';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: StyleApp.outlinedBorder,
                      hintText: 'Nome',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'E-mail obrigatório';
                      } else if (EmailValidator.validate(value) == false) {
                        return 'Insira um e-mail válido';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: StyleApp.outlinedBorder,
                      hintText: 'Digite seu e-mail',
                      suffixIcon: const Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: obscure,
                    decoration: InputDecoration(
                      enabledBorder: StyleApp.outlinedBorder,
                      hintText: 'Digite sua senha',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (obscure) {
                              icon = const Icon(Icons.visibility_off);
                              obscure = false;
                            } else {
                              icon = const Icon(Icons.visibility);
                              obscure = true;
                            }
                          });
                        },
                        icon: icon,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: confirmPassowrdController,
                    validator: (value) {
                      if (value != passwordController.text) {
                        return 'Você deve repetir a senha para confirmação';
                      }
                      return null;
                    },
                    obscureText: obscure2,
                    decoration: InputDecoration(
                      enabledBorder: StyleApp.outlinedBorder,
                      hintText: 'Digite sua senha',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (obscure2) {
                              icon2 = const Icon(Icons.visibility_off);
                              obscure2 = false;
                            } else {
                              icon2 = const Icon(Icons.visibility);
                              obscure2 = true;
                            }
                          });
                        },
                        icon: icon2,
                      ),
                    ),
                  ),
                ),
                DefaultButton(
                  title: "Cadastrar",
                  func: () {
                    register();
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      SignUpModel newUser = SignUpModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      controller.addUser(newUser);
    }
  }
}
