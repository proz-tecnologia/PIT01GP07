import 'package:flutter/material.dart';
import 'constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const CustomDialogBox({ Key? key, required this.title, required this.descriptions, required this.text, required this.img}) : super(key: key);

  @override
  CustomDialogBoxState createState() => CustomDialogBoxState();
}

class CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
              + Constants.padding, right: Constants.padding,bottom: Constants.padding
          ),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.title,style: const TextStyle(fontFamily:'Inter',fontSize: 32,fontWeight: FontWeight.w700,color: Color(0xFF2F595B)),),
              const SizedBox(height: 15,),
              Text(widget.descriptions,style: const TextStyle(fontFamily:'Inter',fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF2F595B)),textAlign: TextAlign.center,),
              const SizedBox(height: 22,),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color (0xFF539CA1)),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text(widget.text,style: const TextStyle(fontFamily:'Inter',fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFFF6F6F6)),)),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: widget.img
            ),
          ),
        ),
      ],
    );
  }
}