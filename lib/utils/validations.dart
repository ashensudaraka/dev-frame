extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^\s*[\w-]+[\.]{0,1}[\w-]*@([\w-]+\.)+[\w-]{2,4}\s*$");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    //Minimum eight characters, at least one letter and one number
    final passwordRegExp = new RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
    return passwordRegExp.hasMatch(this);
  }
}
