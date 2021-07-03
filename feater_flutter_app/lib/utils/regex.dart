class Regex{
  static const String name = r"(^([A-ZÁÉÍÓÚ]{1}[a-z ñáéíóú]+[\s]?)+$)";
  static const String phone = r"(^[0-9]{10}$)";
  static const String email = r"(^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]+$)";
  static const String age = r"^([0-9]){1,3}";
  static const String todo = r".";

  static const String mayus = r'^([A-Z ]{1,})$';
  static const String numberCard = r'^([0-9]){16}$';
  static const String monthCard = r'^([0-9]{2,2})$';
  static const String yearCard = r'^([0-9]{2,2})$';
  static const String cvv =  r'^([0-9]{3})$';
}