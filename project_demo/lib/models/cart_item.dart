import 'package:flutter/material.dart';

class CartItem {
  final int? id;
  final String? image;
  final String? name;
  final String? category;
   final int? quantity;

  /*
  const CartItem({
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onRemove,
  });
*/

  CartItem(this.id, this.name, this.image, this.category, this.quantity);

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      json['id'] as int?, // Optional String
      json['name'] as String?  ?? "Unknown ID", // Optional String

      json['image'] as String? ?? "Unknown ID", // Optional String
      json['category'] as String? ?? "Unknown ID",
       json['quantity'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name': name,
      'image': image,
      'category': category,
       'quantity': quantity,
    };
  }
}
