import 'package:equatable/equatable.dart';
import 'package:prakhya_ecomly/core/common/entities/address.dart';
import 'package:prakhya_ecomly/src/wishlist/domain/entities/wishlist_product.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.wishlist,
    this.address,
    this.phone,
  });

  const User.empty()
    : id = "Test String",
      name = "Test String",
      email = "Test String",
      isAdmin = true,
      wishlist = const [],
      address = null,
      phone = null;

  final String id;
  final String name;
  final String email;
  final bool isAdmin;
  final List<WishListProduct> wishlist;
  final Address? address;
  final String? phone;


  @override
  List<Object?> get props => [id];
}



