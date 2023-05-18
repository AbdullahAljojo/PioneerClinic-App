import 'package:clinicmanagement/Components.dart/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Components.dart/shared.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var priceController = TextEditingController();
      var phoneController = TextEditingController();
    return SafeArea(
      child: Scaffold(
      
        body: Stack(
          
          children: [
            BackGround('assets/images/profile.jpeg', 1),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=826&t=st=1684259583~exp=1684260183~hmac=2a5c05dceb4a3ffdc060295b8f75432d8c4110007aa896d13fc59e79dad4b644'),
                    radius: 70,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 const Text('Cardiologist',
                  style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic,fontFamily: 'font',fontWeight: FontWeight.bold),)
                  ,
                 const SizedBox(height: 40,),
                 buildItem(title: 'name :', controller: nameController, textInputType: TextInputType.name),
                 const SizedBox(height: 30,),
                  buildItem(title: 'price :', controller: priceController, textInputType: TextInputType.number),
                  const SizedBox(height: 30,),
                  buildItem(title: 'phone :', controller: phoneController, textInputType: TextInputType.number)]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildItem({
  required String title,
  required TextEditingController controller,
  required TextInputType  textInputType 
}) => Row(
      children: [
         Text('$title', style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,fontFamily: 'font',fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 20,
        ),
        Spacer(),
        Container(
          width: 260,
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            validator: (value) {
              if (value!.isEmpty) {
                print('name must not be empty');
              }
            },
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        
      ],
    );
