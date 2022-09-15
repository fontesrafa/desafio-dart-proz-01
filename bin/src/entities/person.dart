import 'address.dart';

class Person {
  String? fullName;
  String? cpf;
  Address? address;

  Person(this.fullName, this.cpf, this.address);

  bool validateIdentificationNumber() {
    return true;
  }

  @override
  String toString() => 'CPF: $cpf\nNome Completo: $fullName\n$address';
}
