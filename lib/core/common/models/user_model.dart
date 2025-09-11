import 'dart:convert';

import 'package:prakhya_ecomly/core/common/entities/address.dart';
import 'package:prakhya_ecomly/core/common/entities/user.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';
import 'package:prakhya_ecomly/src/wishlist/data/wishlist_product_model.dart';
import 'package:prakhya_ecomly/src/wishlist/domain/entities/wishlist_product.dart';

import 'address_model.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.isAdmin,
    required super.wishlist,
    super.address,
    super.phone,
  });

  const UserModel.empty()
    : this(
        id: "Test String",
        name: "Test String",
        email: "Test String",
        isAdmin: true,
        wishlist: const [],
        address: null,
        phone: null,
      );

  User copyWith({
    String? id,
    String? name,
    String? email,
    bool? isAdmin,
    List<WishListProduct>? wishlist,
    Address? address,
    String? phone,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isAdmin: isAdmin ?? this.isAdmin,
      wishlist: wishlist ?? this.wishlist,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  String toJson() => jsonEncode(toMap());

  DataMap toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "isAdmin": isAdmin,
      "wishlist":
          wishlist
              .map((product) => (product as WishListProductModel).toMap())
              .toList(),
      if (address != null) 'address': (address as AddressModel).toMap(),
      if (phone != null) 'phone': phone,
    };
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  factory UserModel.fromMap(DataMap map) {
    final address = AddressModel.fromMap({
      if (map case {'street': String street}) 'street': street,
      if (map case {'apartment': String apartment}) 'apartment': apartment,
      if (map case {'city': String city}) 'city': city,
      if (map case {'postalCode': String postalCode}) 'postalCode': postalCode,
      if (map case {'country': String country}) 'country': country,
    });
    return UserModel(
      id: map['id'] as String? ?? map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      isAdmin: map['isAdmin'] as bool,
      wishlist:
          List<DataMap>.from(
            map['wishlist'] as List,
          ).map(WishListProductModel.fromMap).toList(),
      address: address.isEmpty ? null : address,
      phone: map['phone'] as String?,
    );
  }
}
