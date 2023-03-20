import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        description,
        imageUrl,
        isRecommended,
        isPopular,
        price,
        quantity
      ];

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        isRecommended: isRecommended ?? this.isRecommended,
        isPopular: isPopular ?? this.isPopular,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
        id: snap['id'],
        name: snap['name'],
        category: snap['category'],
        description: snap['description'],
        imageUrl: snap['imageUrl'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular'],
        price: snap['price'],
        quantity: snap['quantity']);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromSnapshot(json.decode(source));

  @override
  bool get stringify => false;

  static List<Product> products = [
    Product(
        name: 'Soft Drink #1',
        category: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1517959105821-eaf2591984ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNvZGF8ZW58MHx8MHx8&w=1000&q=80',
        price: 2.99,
        quantity: 10,
        isRecommended: true,
        isPopular: false,
        id: 1,
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
    Product(
        name: 'Soft Drink #2',
        category: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1556881286-fc6915169721?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c29mdCUyMGRyaW5rfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        price: 2.99,
        quantity: 9,
        isRecommended: true,
        isPopular: false,
        id: 2,
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
    Product(
        name: 'Soft Drink #3',
        category: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1527156231393-7023794f363c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y29sZCUyMGRyaW5rc3xlbnwwfHwwfHw%3D&w=1000&q=80',
        price: 2.99,
        quantity: 5,
        isRecommended: false,
        isPopular: true,
        id: 3,
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
    Product(
        name: 'Smoothies #1',
        category: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1600718374662-0483d2b9da44?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNtb290aGllfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        price: 2.99,
        quantity: 8,
        isRecommended: true,
        isPopular: false,
        id: 4,
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
    Product(
        name: 'Smoothies #2',
        category: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1589733955941-5eeaf752f6dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZnJ1aXQlMjBzbW9vdGhpZXxlbnwwfHwwfHw%3D&w=1000&q=80',
        price: 2.99,
        quantity: 10,
        isRecommended: false,
        isPopular: true,
        id: 5,
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
  ];
}
