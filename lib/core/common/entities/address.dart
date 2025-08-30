import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    required this.street,
    required this.apartment,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  const Address.empty()
    : street = "Test String",
      apartment = "Test String",
      city = "Test String",
      postalCode = "Test String",
      country = "Test String";

  final String? street;
  final String? apartment;
  final String? city;
  final String? postalCode;
  final String? country;

  bool get isEmpty =>
      street == null &&
      apartment == null &&
      city == null &&
      postalCode == null &&
      country == null;

  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [street, apartment, city, postalCode, country];
}
