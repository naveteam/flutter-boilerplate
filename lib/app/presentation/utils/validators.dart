extension ValidatorsExtension on String? {
  bool isNotNull() => this != null;

  String? isEmail(String message) => isNotNull() &&
          this!.isNotEmpty &&
          RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(this!)
      ? null
      : message;

  String? isPassword(String message) =>
      isNotNull() && this!.isNotEmpty ? null : message;
}
