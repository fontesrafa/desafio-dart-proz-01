class Address {
  String? streetName;
  String? number;
  String? district;
  String? complement;
  String? city;
  String? state;
  String? postalCode;

  Address(
    this.streetName,
    this.number,
    this.district,
    this.complement,
    this.city,
    this.state,
    this.postalCode,
  );

  @override
  String toString() {
    return 'Endereço: $streetName, $number, $complement, $district, $city/$state, $postalCode';
  }
}
