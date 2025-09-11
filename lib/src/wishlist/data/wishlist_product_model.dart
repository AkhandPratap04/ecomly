import 'dart:convert';

import 'package:prakhya_ecomly/core/utils/typedefs.dart';

import '../domain/entities/wishlist_product.dart';

class WishListProductModel extends WishListProduct {
  const WishListProductModel({
    required super.productId,
    required super.productName,
    required super.productImage,
    required super.productPrice,
    required super.productExists,
    required super.productOutOfStock,
  });

  const WishListProductModel.empty()
    : this(
        productId: "Test String",
        productName: "Test String",
        productImage: "Test String",
        productPrice: 1.0,
        productExists: true,
        productOutOfStock: true,
      );

  WishListProductModel copyWith({
    String? productId,
    String? productName,
    String? productImage,
    double? productPrice,
    bool? productExists,
    bool? productOutOfStock,
  }) {
    return WishListProductModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      productPrice: productPrice ?? this.productPrice,
      productExists: productExists ?? this.productExists,
      productOutOfStock: productOutOfStock ?? this.productOutOfStock,
    );
  }

  DataMap toMap() => {
    "productId": productId,
    "productName": productName,
    "productImage": productImage,
    "productPrice": productPrice,
    "productExists": productExists,
    "productOutOfStock": productOutOfStock,
  };
  String toJson() => jsonEncode(toMap() as String);

  WishListProductModel.fromMap(DataMap map)
    : this(
        productId: map["productId"],
        productName: map["productName"],
        productImage: map["productImage"],
        productPrice: map["productPrice"],
        productExists: map["productExists"],
        productOutOfStock: map["productOutOfStock"],
      );

  factory WishListProductModel.fromJson(String source) =>
      WishListProductModel.fromMap(jsonDecode(source));
}
