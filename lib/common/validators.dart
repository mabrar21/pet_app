class FormValidators {
  static String? isEmptyValidator (String? value) {
    if (value!.isEmpty) {
      return 'The field is mandatory';
    }
    return null;
  }
}
