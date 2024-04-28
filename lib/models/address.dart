import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/federative_unit.dart';

class Address {
  Address(
      {required this.federativeUnit,
      required this.city,
      required this.postalCode,
      required this.district,
      required this.street});

  FederativeUnit federativeUnit;
  City city;
  String postalCode;
  String district;
  String street;

  @override
  String toString() {
    return 'Address{federativeUnit: $federativeUnit, city: $city, postalCode: $postalCode, district: $district, street: $street}';
  }
}
