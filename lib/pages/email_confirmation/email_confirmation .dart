import 'package:flutter/material.dart';

class EmailConfirmation extends StatelessWidget {
  const EmailConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: Padding(
        
        padding: const EdgeInsets.only(left:16,right:16),
        child: Column(
             children: <Widget>[
              const SizedBox(height:56),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('E-mail enviado',
                 style: TextStyle(
                 fontFamily:'Inter',
                 fontWeight:FontWeight.w600,
                 fontSize: 32,
                 color: Color (0xFF539CA1),
                ),),
              ),
              const SizedBox(height:32),
              const Text(
                 'Verifique sua conta de e-mail para a finalizar a verificação. O link enviado irá lhe redirencionar para a criação de uma nova senha.',
                 style: TextStyle(
                   fontFamily:'Inter',
                   fontWeight:FontWeight.w500,
                   fontSize: 16,
                   color: Color (0xFF539CA1),
                 ),),
              const SizedBox(height:36),
              const Expanded (
                 child: Image(image: AssetImage( "assets/images/background/email.png"),
                   width: 200,
                   height: 200,
                 ),
               ),
              const SizedBox(height:36),
              ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 48), backgroundColor: const Color (0xFF539CA1)),
                child: const Text('Finalizar',
                  style: TextStyle(
                  fontFamily:'Inter',
                  fontWeight:FontWeight.w500,
                  fontSize: 24,
                  color: Color (0xFFF6F6F6),
                ),),
              ),
              const SizedBox(height:96),
        ],
        ), 
    ),
    );
  }
}
