import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pet_app/api/apiHelper.dart';
import 'package:pet_app/components/petProfile/basicDetails.dart';
import 'package:pet_app/components/petProfile/generalInformation.dart';
import 'package:pet_app/model/pet.dart';
import 'package:pet_app/themes/appTheme.dart';

class PetProfilePage extends StatefulWidget {
  PetProfilePage({Key? key, required this.pet}) : super(key: key);
  final Pet pet;

  @override
  _PetProfilePageState createState() => _PetProfilePageState(pet: this.pet);
}

class _PetProfilePageState extends State<PetProfilePage> {
  Pet pet;
  final _formKey = GlobalKey<FormState>();

  _PetProfilePageState({required this.pet});

  Widget getWrapperCard(child) {
    return Row(children: [
      Expanded(
        child: Padding(
          child: child,
          padding: AppTheme.defaultPaddingSmall,
        ),
      )
    ]);
  }

  updatePet(Pet newPet) {
    setState(() {
      pet = newPet;
    });
  }

  savePetToServer(Pet pet, context) {
    ApiEngine()
        .post(pet)
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Successfully submitted to server",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            )));
  }

  Widget getProfileImageWrapper(image) {
    return Stack(
      children: [
        Image.asset(
          image,
        ),
        Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: AppTheme.getActionIconWrapper(Icon(
                    Icons.chevron_left,
                    size: AppTheme.defaultActionButtonSize,
                    color: AppTheme.COLOR_DARK_GREY,
                  )),
                  onTap: () {
                    if (_formKey.currentState?.validate() != false) {
                      _formKey.currentState?.save();
                      savePetToServer(pet, context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Error Submitting profile, recheck input fields",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                ),
                AppTheme.getActionIconWrapper(Icon(
                  Icons.camera_alt_outlined,
                  size: AppTheme.defaultActionButtonSize,
                  color: AppTheme.COLOR_DARK_GREY,
                ))
              ],
            ),
            padding: AppTheme.defaultPaddingMedium)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: ListView(children: [
        Column(
          children: [
            getProfileImageWrapper(this.pet.image),
            Container(
              transform: Matrix4.translationValues(0, -40, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      getWrapperCard(BasicDetails(
                          pet: this.pet, updateGlobalPetState: updatePet)),
                      getWrapperCard(GeneralInformation(
                          pet: this.pet, updateGlobalPetState: updatePet)),
                    ],
                  )),
            )
          ],
        ),
      ]),
    );
  }
}
