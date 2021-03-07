import 'package:flutter/material.dart';
import 'package:pet_app/model/pet.dart';
import 'package:pet_app/screens/petProfile.dart';

void main() {
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Pet pet =  new Pet();
    pet.firstName = 'Honko';
    pet.image = 'assets/images/dog.jpg';
    pet.lastWalk = DateTime.now().toString();
    pet.reminder = false;
    pet.race = 'Hound';
    pet.gender = 'Female';
    pet.species = 'Dog';
    return MaterialApp(
      title: 'Pet App',
      home: PetProfilePage(pet: pet),
    );
  }
}
