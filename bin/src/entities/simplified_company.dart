import 'address.dart';

class SimplifiedCompany {
  String? companyName;
  String? tradingName;
  String? cnpj;
  Address? address;

  SimplifiedCompany(this.companyName, this.tradingName,this.cnpj, this.address);

  bool validateIdentificationNumber() {
    return true;
  }

  @override
  String toString() => 'CNPJ: $cnpj\nRazão Social: $companyName\nNome Fantasia: $tradingName\n$address';
}