import 'package:flutter/material.dart';
import '../../widgets/dialog_box/custom_dialog_box.dart';
import '../email_confirmation/email_confirmation .dart';

class RecoverScreen extends StatefulWidget {
  const RecoverScreen({super.key});

  @override
  State<RecoverScreen> createState() => _RecoverScreen();
}
class _RecoverScreen extends State<RecoverScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left:16,right:16),
        child: Form(
             key:_formKey,
             child: Column(
             children: <Widget>[
              const SizedBox(height:32),
              Align(
               alignment: Alignment.topLeft,
               child: IconButton(
                alignment:Alignment.centerLeft,
                icon: const Icon(Icons.arrow_back),
                color:const Color (0xFF539CA1),
                onPressed: () {}),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Recuperar senha',
                 style: TextStyle(
                 fontFamily:'Inter',
                 fontWeight:FontWeight.w600,
                 fontSize: 32,
                 color: Color (0xFF539CA1),
                ),),
              ),
              const SizedBox(height:32),
              const Text(
                 'Por favor, informe seu email cadastrado para que uma nova senha seja criada.',
                 style: TextStyle(
                   fontFamily:'Inter',
                   fontWeight:FontWeight.w500,
                   fontSize: 14,
                   color: Color (0xFF539CA1),
                 ),),
              const SizedBox(height:32),
              SizedBox(
                child: TextFormField(
                   controller: _emailController,
                   cursorColor: const Color (0xFF539CA1),
                   decoration: InputDecoration(
                   counterText:" ",
                   focusColor:  const Color (0xFF539CA1),
                   border:  OutlineInputBorder(
                   borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                   borderSide: BorderSide(color: const Color(0xFF539CA1).withOpacity(0.4), width: 2),
    ),
                   focusedBorder: const OutlineInputBorder(
                   borderSide: BorderSide(color: Color (0xFF539CA1),width: 2),),
                   hintText:  'Digite seu e-mail',
                       labelStyle: TextStyle(
                         fontFamily:'Inter',
                         fontWeight:FontWeight.w500,
                         fontSize: 14,
                         color: const Color(0xFF539CA1).withOpacity(0.5),
                       ),
                   ),
                   style: const TextStyle(
                       fontFamily:'Inter',
                       fontWeight:FontWeight.w500,
                       fontSize: 14,
                       color: Color (0xFF2F595B),
                     ),
                 validator:(email){
                 if (email==null || email.isEmpty){
                 return 'E-mail obrigatório';
                 }else if (!email.contains("@")){
                  return 'Email inválido';
                 };
                 return null;
                 }
                 ),
              ),
              const SizedBox(height:24),
              ElevatedButton(
                 onPressed: () {
                   if (_formKey.currentState!.validate()){}
                   Navigator.push(context,MaterialPageRoute(builder:
                   (context)=> const EmailConfirmation()),
                   );
                 },
                 style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 48), backgroundColor: const Color (0xFF539CA1)),
                child: const Text('Próximo',
                  style: TextStyle(
                  fontFamily:'Inter',
                  fontWeight:FontWeight.w500,
                  fontSize: 14,
                  color: Color (0xFFF6F6F6),
                ),),
              ),
              const SizedBox(height:96),
               ElevatedButton(
                 onPressed: () {
                   showDialog(context: context,
                     builder: (BuildContext context)
                     {
                       return CustomDialogBox(
                         title: "Oops!",
                         descriptions: "Não conseguimos identificar esse endereço de e-mail, mas você pode tentar de novo. ",
                         text: "Tentar de novo",
                         img: Image.asset('assets/images/background/erro.png'),
                       );
                     },
                   );
                 },
                 style: ElevatedButton.styleFrom(
                     fixedSize: const Size(200, 48), backgroundColor: const Color (0xFF539CA1)),
                 child: const Text('MENSAGEM DE ERRO',
                   style: TextStyle(
                     fontFamily:'Inter',
                     fontWeight:FontWeight.w500,
                     fontSize: 14,
                     color: Color (0xFFF6F6F6),
                   ),),
               ),
               const SizedBox(height:16),
               const Expanded(
                child: Image(image: AssetImage( "assets/images/background/forgot_password.png"),
                 alignment: Alignment.bottomLeft,
                ),
              ),
        ],
             ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
