import 'dart:convert';

import 'package:prakhya_ecomly/core/common/entities/address.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.street,
    required super.apartment,
    required super.city,
    required super.postalCode,
    required super.country,
  });

  const AddressModel.empty()
    : this(
        street: "Test String",
        apartment: "Test String",
        city: "Test String",
        postalCode: "Test String",
        country: "Test String",
      );

  AddressModel copyWith({
    String? street,
    String? apartment,
    String? city,
    String? postalCode,
    String? country,
  }) {
    return AddressModel(
      street: street ?? this.street,
      apartment: apartment ?? this.apartment,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
    );
  }

  DataMap toMap() {
    return {
      "street": street,
      "apartment": apartment,
      "city": city,
      "postalCode": postalCode,
      "country": country,
    };
  }

  String toJson()=> jsonEncode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(jsonDecode(source));

  AddressModel.fromMap(DataMap map)
    : this(
        street: map['street'],
        apartment: map['apartment'],
        city: map['city'],
        postalCode: map['postalCode'],
        country: map['country'],
      );


}
