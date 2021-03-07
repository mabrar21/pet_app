import 'package:flutter/cupertino.dart';

class PetProfileFormController {
  PetProfileFormController(){
    firstName = TextEditingController();
  }
  TextEditingController? firstName, surName, lastName;
}
