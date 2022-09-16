import 'address.dart';
import 'partner.dart';

class Person implements Partner{
  String? fullName;
  String? cpf;
  Address? address;

  Person(this.fullName, this.cpf, this.address);

  @override
  bool validateIdentificationNumber() {
    return true;
  }

  @override
  String toString() => 'CPF: $cpf\nNome Completo: $fullName\n$address';
}
