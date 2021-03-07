import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/common/formUtils.dart';
import 'package:pet_app/common/strings.dart';
import 'package:pet_app/common/validators.dart';
import 'package:pet_app/model/pet.dart';
import 'package:pet_app/themes/appTheme.dart';
import 'package:pet_app/widgets/basicCard.dart';

class GeneralInformation extends StatefulWidget {
  GeneralInformation({required this.pet, required this.updateGlobalPetState});

  final Function updateGlobalPetState;
  final Pet pet;

  @override
  State<StatefulWidget> createState() {
    return _GeneralInformationState(pet, updateGlobalPetState);
  }
}

class _GeneralInformationState extends State<GeneralInformation> {
  _GeneralInformationState(this.pet, this.updateGlobalPetState);

  Function updateGlobalPetState;
  var _selectedRace = Species.values[0];
  var _selectedGender = Gender.values[0];
  var _selectedDob = DateFormat('dd.MM.yyyy').format(DateTime.now());
  Pet pet;

  Widget getInputTextField(label,value, onSaved) {
    return BasicCard().getRowWrapper([
      Expanded(
        child: TextFormField(
          decoration: AppTheme.basicCardInputBorderStyle(label),
          validator: FormValidators.isEmptyValidator,
          autofocus: false,
          initialValue: value,
          onSaved: (value) {
            onSaved(value);
            updateGlobalPetState(pet);
          },
        ),
        // AppTheme.defaultDivider,
      )
    ]);
  }

  Widget getInputSelectField(label, dropdownValues, value, onChange) {
    return BasicCard().getRowWrapper([
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label),
              DropdownButtonFormField(
                value: value,
                items: dropdownValues,
                onChanged: onChange,
                iconSize: 0,
                decoration: InputDecoration.collapsed(hintText: ''),
              )
            ],
          ),
        ),
      )
    ]);
  }

  Widget getDobPicker(BuildContext context, label) {
    return BasicCard().getRowWrapper([
      Expanded(
        child: GestureDetector(
          child: Padding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label),
                Padding(
                    child: Text(_selectedDob),
                    padding: AppTheme.defaultPaddingMediumTop),
              ],
            ),
            padding: EdgeInsets.all(12),
          ),
          onTap: () {
            FormUils().selectDate(
                context,
                DateFormat("dd.MM.yyyy").parse(_selectedDob),
                (value) => {
                      setState(() {
                        if (value != null) {
                          this._selectedDob =
                              DateFormat("dd.MM.yyyy").format(value);
                          pet.dateOfBirth = value;
                          updateGlobalPetState(pet);
                        }
                      })
                    });
          },
          // AppTheme.defaultDivider,
        ),
      )
    ]);
  }

  Widget getGeneralInfoCard(context) {
    return BasicCard(title: GlobalStrings.GENERAL_INFORMATION, children: [
      Column(
        children: [
          getInputTextField(GlobalStrings.FIRSTNAME + '*',pet.firstName, (value) {
            setState(() {
              pet.firstName = value;
            });
          }),
          AppTheme.defaultDivider,
          getInputTextField(GlobalStrings.SURNAME, pet.lastName, (value) {
            setState(() {
              pet.lastName = value;

            });
          }),
          AppTheme.defaultDivider,
          getInputSelectField(GlobalStrings.SPECIES + '*',
              Species().getValuesAsDropdownItems(), pet.species, (newValue) {
            setState(() {
              _selectedRace = newValue;
              pet.species = newValue;
              updateGlobalPetState(pet);
            });
          }),
          AppTheme.defaultDivider,
          getInputTextField(GlobalStrings.RACE + '*', pet.race, (value) {
            pet.race = value;
          }),
          AppTheme.defaultDivider,
          getInputSelectField(GlobalStrings.GENDER + '*',
              Gender().getValuesAsDropdownItems(), pet.gender, (newValue) {
            setState(() {
              _selectedGender = newValue;
              pet.gender = newValue;
              updateGlobalPetState(pet);
            });
          }),
          AppTheme.defaultDivider,
          getDobPicker(context, GlobalStrings.BIRTHDAY)
        ],
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return getGeneralInfoCard(context);
  }
}
