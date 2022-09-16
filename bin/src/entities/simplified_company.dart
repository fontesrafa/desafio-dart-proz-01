import 'address.dart';
import 'partner.dart';

class SimplifiedCompany implements Partner{
  String? companyName;
  String? tradingName;
  String? cnpj;
  Address? address;

  SimplifiedCompany(this.companyName, this.tradingName,this.cnpj, this.address);

  @override
  bool validateIdentificationNumber() {
    return true;
  }

  @override
  String toString() => 'CNPJ: $cnpj\nRazão Social: $companyName\nNome Fantasia: $tradingName\n$address';
}