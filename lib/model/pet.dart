import 'package:flutter/material.dart';

class Pet {
  String firstName = '';
  String lastName = '';
  String species = '';
  String race = '';
  String dateOfBirth = '';
  String image = "assets/images/dog.jpg";
  String gender = '';
  String lastWalk = '';
  bool reminder = false;

  Map<String, dynamic> toJson() {
    var json =  {
      'firstName': firstName,
      'lastName': lastName,
      'species': species,
      'race': race,
      'dateOfBirth': dateOfBirth,
      'image': image,
      'gender': gender,
      'lastWalk': lastWalk,
      'reminder': reminder
    };

    return json;
  }

}

class PetWalkInfo {
  PetWalkInfo(this.lastWalk, this.reminder);

  DateTime? lastWalk;
  bool? reminder;
}

abstract class DropDownEnum {
  getValuesAsDropdownItems();
}

class Gender {
  static const values = <String>[
    'Male',
    'Female'
  ];
  var value = values[0];

  @override
  getValuesAsDropdownItems() {
    return values.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}

class Species extends DropDownEnum {
  static const values = <String>[
    'Dog',
    'Cat',
    'Horse',
  ];
  var value = values[0];

  @override
  getValuesAsDropdownItems() {
    return values.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

}
