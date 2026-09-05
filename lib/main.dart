import 'package:flutter/material.dart';

void main() {
  runApp(const BuyNovaApp());
}

/* =========================================================
   MODELS
========================================================= */

class Product {
  final String id;
  String name;
  int price;
  String category;
  IconData icon;
  double rating;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.icon,
    this.rating = 4.5,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class Address {
  String name;
  String phone;
  String address;
  String city;

  Address({
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
  });
}

class Order {
  final String id;
  final List<CartItem> items;
  final int total;
  final Address address;
  final DateTime date;
  String status;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.address,
    required this.date,
    this.status = 'Order Placed',
  });
}

/* =========================================================
   INITIAL PRODUCTS
========================================================= */

final List<Product> products = [
  Product(
    id: 'p001',
    name: 'Smart Phone',
    price: 499000,
    category: 'Phones',
    icon: Icons.phone_android,
    rating: 4.8,
  ),
  Product(
    id: 'p002',
    name: 'Smart Watch',
    price: 39900,
    category: 'Watches',
    icon: Icons.watch,
    rating: 4.6,
  ),
  Product(
    id: 'p003',
    name: 'Wireless Earbuds',
    price: 29900,
    category: 'Audio',
    icon: Icons.headphones,
    rating: 4.7,
  ),
  Product(
    id: 'p004',
    name: 'Laptop',
    price: 899000,
    category: 'Electronics',
    icon: Icons.laptop,
    rating: 4.9,
  ),
  Product(
    id: 'p005',
    name: 'Camera',
    price: 299000,
    category: 'Electronics',
    icon: Icons.camera_alt,
    rating: 4.6,
  ),
  Product(
    id: 'p006',
    name: 'Backpack',
    price: 24900,
    category: 'Fashion',
    icon: Icons.backpack,
    rating: 4.4,
  ),
];

/* =========================================================
   APP
========================================================= */

class BuyNovaApp extends StatelessWidget {
  const BuyNovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BuyNova',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginPage(),
    );
  }
}

/* =========================================================
   LOGIN
========================================================= */

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;

  void login() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email এবং Password দিন'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 45),

              CircleAvatar(
                radius: 55,
                backgroundColor:
                    Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.shopping_bag_rounded,
                  size: 58,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'BuyNova',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Everything you love, in one place.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: I
