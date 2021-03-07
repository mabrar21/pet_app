import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/common/formUtils.dart';
import 'package:pet_app/common/strings.dart';
import 'package:pet_app/model/pet.dart';
import 'package:pet_app/themes/appTheme.dart';
import 'package:pet_app/widgets/basicCard.dart';

class BasicDetails extends StatefulWidget {
  BasicDetails({required this.pet, required this.updateGlobalPetState});
  final Function updateGlobalPetState;
  final Pet pet;

  @override
  State<StatefulWidget> createState() {
    return _BasicDetailsState(pet, updateGlobalPetState);
  }
}

class _BasicDetailsState extends State<BasicDetails> {
  _BasicDetailsState(this.pet, this.updateGlobalPetState);
  Function updateGlobalPetState;
  Pet pet;
  TimeOfDay selectedTime = TimeOfDay.now();
  var _selectedReminder;


  Widget getLinkRow(icon, text) {
    return BasicCard().getRowWrapper([
      Row(children: [
        Icon(icon),
        Padding(child: Text(text), padding: AppTheme.defaultPaddingMedium),
      ]),
      Icon(Icons.chevron_right),
    ]);
  }

  Widget getLastWalkRow(icon, text) {
    return BasicCard().getRowWrapper([
      GestureDetector(
        child: Row(children: [
          Icon(icon),
          Padding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text),
                  Text(
                      '${DefaultMaterialLocalizations().formatHour(selectedTime)}:${DefaultMaterialLocalizations().formatMinute(selectedTime)} Uhr'),
                ],
              ),
              padding: AppTheme.defaultPaddingMedium),
        ]),
        onTap: () {
          FormUils().selectTime(context, selectedTime, (value){
            setState(() {
              if(value != null){
                selectedTime = value;
                pet.lastWalk = value;
                updateGlobalPetState(pet);
              }
            });
          });
        },
      )
    ]);
  }

  Widget getRemiderSwitchRow() {
    return BasicCard().getRowWrapper([
      Text(GlobalStrings.DAILY_REMINDER_NOTIFICATIONS),
      FormField(builder: (state) {
        return Switch(
          value: _selectedReminder ?? pet.reminder ,
          onChanged: (value) {
            setState(() {
              _selectedReminder = value;
              pet.reminder = value;
              updateGlobalPetState(pet);
            });
          },
          activeColor: AppTheme.COLOR_ORANGE,
        );
      })
    ]);
  }

  Widget getBasicsCard(BuildContext context) {
    return BasicCard(title: this.pet.firstName, children: [
      getLinkRow(Icons.pets, GlobalStrings.DNA_AND_ANCESTRY),
      AppTheme.defaultDivider,
      getLinkRow(Icons.filter_vintage_rounded, GlobalStrings.ALLERGY_TEST),
      AppTheme.defaultDivider,
      getLastWalkRow(Icons.access_time, GlobalStrings.LAST_WALK),
      AppTheme.defaultDivider,
      getRemiderSwitchRow(),
    ]);
  }



  @override
  Widget build(BuildContext context) {
    return getBasicsCard(context);
  }
}
