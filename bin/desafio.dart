import 'src/entities/address.dart';
import 'src/entities/company.dart';
import 'src/entities/partner.dart';
import 'src/entities/person.dart';
import 'src/entities/simplified_company.dart';

import 'dart:io';

void main(List<String> args) {
  List<Company> companyList = [];
  bool control = true;

  while (control) {
    showMenu();

    int answer = int.parse(stdin.readLineSync()!);
    switch (answer) {
      case 1:
        companyList.add(registerCompany()!);
        break;
      case 2:
        String cnpj = stdin.readLineSync()!;
        int index = companyList.indexWhere((a) => a.cnpj == cnpj);
        print(companyList[index]);
        stdin.readLineSync()!;
        break;
      case 3:
        break;
      case 4:
        companyList.sort((a, b) => a.companyName!.compareTo(b.companyName!));
        print(companyList);
        stdin.readLineSync()!;
        break;
      case 5:
        String id = readCompanyId();
        companyList.removeWhere((company) => company.id == id);
        stdin.readLineSync()!;
        break;
      case 6:
        control = false;
        break;
      default:
        print('Opção inválida. Tente novamente.\n');
    }
  }
}

void showMenu() {
  print("\x1B[2J\x1B[0;0H");
  print(
      "--------------------- SISTEMA DE CADASTRO DE EMPRESAS ---------------------\n");
  print('Escolha uma das opções abaixo:\n');
  print('1 - Cadastrar uma nova empresa\n'
      '2 - Buscar Empresa cadastrada por CNPJ\n'
      '3 - Buscar Empresa por CPF/CNPJ do Sócio\n'
      '4 - Listar Empresas cadastradas em ordem alfabética\n'
      '5 - Excluir uma empresa (por ID)\n'
      '6 - Sair\n');
}

Company? registerCompany() {
  String? companyName;
  String? tradingName;
  String? cnpj;
  String? phoneNumber;
  Address address;
  Partner partner = registerPartner();
  print("\x1B[2J\x1B[0;0H");
  print("--------------------- CADASTRAR NOVA EMPRESA ---------------------");

  print('Digite a Razão Social: ');
  companyName = stdin.readLineSync()!;
  print('Digite o Nome de Fantasia: ');
  tradingName = stdin.readLineSync()!;
  print('Digite o CNPJ: ');
  cnpj = stdin.readLineSync()!;
  print('Digite o Phone Number: ');
  phoneNumber = stdin.readLineSync()!;
  address = registerAddress();

  return Company(companyName, tradingName, cnpj, phoneNumber, address, partner);
}

Address registerAddress() {
  String? streetName;
  String? number;
  String? district;
  String? complement;
  String? city;
  String? state;
  String? postalCode;

  print("\x1B[2J\x1B[0;0H");
  print("--------------------- CADASTRAR ENDEREÇO ---------------------\n");
  print('Digite os dados do endereço abaixo:\n');
  print('Logradouro: ');
  streetName = stdin.readLineSync()!;
  print('Numero: ');
  number = stdin.readLineSync()!;
  print('Bairro: ');
  district = stdin.readLineSync()!;
  print('Complemento: ');
  complement = stdin.readLineSync()!;
  print('Cidade: ');
  city = stdin.readLineSync()!;
  print('Estado (sigla): ');
  state = stdin.readLineSync()!;
  print('CEP: ');
  postalCode = stdin.readLineSync()!;

  return Address(
      streetName, number, district, complement, city, state, postalCode);
}

Person registerPerson() {
  String? fullName;
  String? cpf;
  Address? address;

  print("\x1B[2J\x1B[0;0H");
  print(
      "--------------------- CADASTRAR PESSOA FISICA ---------------------\n");
  print('Digite o nome completo:\n');
  fullName = stdin.readLineSync()!;
  print('Digite o CPF:\n');
  cpf = stdin.readLineSync()!;
  address = registerAddress();

  return Person(fullName, cpf, address);
}

SimplifiedCompany registerSimplifiedCompany() {
  String? companyName;
  String? tradingName;
  String? cnpj;
  Address? address;

  print("\x1B[2J\x1B[0;0H");
  print(
      "--------------------- CADASTRAR PESSOA JURÍDICA ---------------------\n");
  print('Digite a Razão Social:');
  companyName = stdin.readLineSync()!;
  print('Digite o Nome de Fantasia:');
  tradingName = stdin.readLineSync()!;
  print('Digite o CNPJ:');
  cnpj = stdin.readLineSync()!;
  address = registerAddress();

  return SimplifiedCompany(companyName, tradingName, cnpj, address);
}

Partner registerPartner() {
  print("\x1B[2J\x1B[0;0H");
  print("--------------------- CADASTRAR SOCIO ---------------------");
  print('\nEscolha o tipo de sócio abaixo:\n');
  print('1 - Pessoa Física\n');
  print('2 - Pessoa Jurídica\n');

  int option = int.parse(stdin.readLineSync()!);

  switch (option) {
    case 1:
      return registerPerson();
    case 2:
      return registerSimplifiedCompany();
    default:
      return registerPartner();
  }
}

String readCompanyId() {
  print("\x1B[2J\x1B[0;0H");
  print("--------------------- DELETAR PELO ID ---------------------");
  print('Digite o ID da Empresa que deseja deletar:');
  return stdin.readLineSync()!;
}
