import 'package:uuid/uuid.dart';

import 'partner.dart';
import 'simplified_company.dart';

class Company extends SimplifiedCompany {
  String id = Uuid().v1();
  String? phoneNumber;
  DateTime registrationTime = DateTime.now();
  Partner? partner;

  Company(super.companyName, super.tradingName, super.cnpj, this.phoneNumber,
      super.address, this.partner);

  @override
  bool validateIdentificationNumber() {
    return true;
  }

  @override
  String toString() =>
      'ID: $id\n'
      'CNPJ: $cnpj  Data Cadastro: $registrationTime\n'
      'Razão Social: $companyName\n'
      'Nome Fantasia: $tradingName\n'
      'Telefone: $phoneNumber\n'
      '$address\n'
      'Sócio:\n'
      '$partner';
}
