import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({Key? key}) : super(key: key);

  XFile profileImage(img) {
    return img;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border(
            bottom: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.primary),
            top: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.primary),
            left: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.primary),
            right: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.primary),
          ),
        ),
        child: Stack(
          children: <Widget>[
            const Image(image: AssetImage('assets/images/user_profile.png')),
            Center(
              child: IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 32,
                ),
                onPressed: () async {
                  ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  if(image == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Imagem não selecionada.'),),);
                  }
                  if(image != null) {
                    profileImage(image);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
