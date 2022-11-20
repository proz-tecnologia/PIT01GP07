import 'package:flutter/material.dart';

class RecoverScreen extends StatelessWidget {
  const RecoverScreen({super.key});


   @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left:16,right:16),
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
                height:52,
                child: TextField(
                   cursorColor: const Color (0xFF539CA1),
                   decoration: InputDecoration(
                   focusColor:  const Color (0xFF539CA1),
                   enabledBorder: OutlineInputBorder(
                   borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                   borderSide: BorderSide(color: const Color(0xFF539CA1).withOpacity(0.4), width: 2),
    ),
                   focusedBorder: const OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                   borderSide: BorderSide(color: Color (0xFF539CA1),width: 2),),
                   labelText: 'Digite seu e-mail',
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
                 ),
              ),
              const SizedBox(height:24),
              ElevatedButton(
                 onPressed: () {
                   Navigator.push(context,MaterialPageRoute(builder:
                   (context)=>const ),
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
              const Expanded(
                child: Image(image: AssetImage( "assets/images/background/forgot_password.png"),
                 alignment: Alignment.bottomLeft,
                ),
              ),
        ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
