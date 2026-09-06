import 'package:flutter/material.dart'; void main() { runApp(const BuyNovaApp()); } /* ========================================================= MODELS ========================================================= */ class Product { final String id; String name; int price; String category; IconData icon; double rating; Product({ required this.id, required this.name, required this.price, required this.category, required this.icon, this.rating = 4.5, }); } class CartItem { final Product product; int quantity; CartItem({ required this.product, this.quantity = 1, }); } class Address { String name; String phone; String address; String city; Address({ required this.name, required this.phone, required this.address, required this.city, }); } class Order { final String id; final List<CartItem> items; final int total; final Address address; final DateTime date; String status; Order({ required this.id, required this.items, required this.total, required this.address, required this.date, this.status = 'Order Placed', }); } /* ========================================================= INITIAL PRODUCTS ========================================================= */ final List<Product> products = [ Product( id: 'p001', name: 'Smart Phone', price: 499000, category: 'Phones', icon: Icons.phone_android, rating: 4.8, ), Product( id: 'p002', name: 'Smart Watch', price: 39900, category: 'Watches', icon: Icons.watch, rating: 4.6, ), Product( id: 'p003', name: 'Wireless Earbuds', price: 29900, category: 'Audio', icon: Icons.headphones, rating: 4.7, ), Product( id: 'p004', name: 'Laptop', price: 899000, category: 'Electronics', icon: Icons.laptop, rating: 4.9, ), Product( id: 'p005', name: 'Camera', price: 299000, category: 'Electronics', icon: Icons.camera_alt, rating: 4.6, ), Product( id: 'p006', name: 'Backpack', price: 24900, category: 'Fashion', icon: Icons.backpack, rating: 4.4, ), ]; /* ========================================================= APP ========================================================= */ class BuyNovaApp extends StatelessWidget { const BuyNovaApp({super.key}); @override Widget build(BuildContext context) { return MaterialApp( debugShowCheckedModeBanner: false, title: 'BuyNova', theme: ThemeData( useMaterial3: true, colorSchemeSeed: Colors.blue, scaffoldBackgroundColor: Colors.white, ), home: const LoginPage(), ); } } /* ========================================================= LOGIN ========================================================= */ class LoginPage extends StatefulWidget { const LoginPage({super.key}); @override State<LoginPage> createState() => _LoginPageState(); } class _LoginPageState extends State<LoginPage> { final emailController = TextEditingController(); final passwordController = TextEditingController(); bool showPassword = false; void login() { if (emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty) { ScaffoldMessenger.of(context).showSnackBar( const SnackBar( content: Text('Email এবং Password দিন'), ), ); return; } Navigator.pushReplacement( context, MaterialPageRoute( builder: (_) => const HomePage(), ), ); } @override void dispose() { emailController.dispose(); passwordController.dispose(); super.dispose(); } @override Widget build(BuildContext context) { return Scaffold( body: SafeArea( child: SingleChildScrollView( padding: const EdgeInsets.all(24), child: Column( children: [ const SizedBox(height: 45), CircleAvatar( radius: 55, backgroundColor: Theme.of(context).colorScheme.primaryContainer, child: Icon( Icons.shopping_bag_rounded, size: 58, color: Theme.of(context).colorScheme.primary, ), ), const SizedBox(height: 18), const Text( 'BuyNova', style: TextStyle( fontSize: 34, fontWeight: FontWeight.bold, ), ), const SizedBox(height: 8), const Text( 'Everything you love, in one place.', textAlign: TextAlign.center, ), const SizedBox(height: 40), TextField( controller: emailController, keyboardType: TextInputType.emailAddress, decoration: InputDecoration( labelText: 'Email', prefixIcon: const Icon(Icons.email_outlined), border: OutlineInputBorder( borderRadius: BorderRadius.circular(16), ), ), ), const SizedBox(height: 18), TextField( controller: passwordController, obscureText: !showPassword, decoration: InputDecoration( labelText: 'Password', prefixIcon: const Icon(Icons.lock_outline), suffixIcon: IconButton( onPressed: () { setState(() { showPassword = !showPassword; }); }, icon: Icon( showPassword ? Icons.visibility : Icons.visibility_off, ), ), border: OutlineInputBorder( borderRadius: BorderRadius.circular(16), ), ), ), const SizedBox(height: 25), SizedBox( width: double.infinity, height: 55, child: FilledButton( onPressed: login, child: const Text( 'Login', style: TextStyle(fontSize: 17), ), ), ), const SizedBox(height: 15), const Text( 'Demo login: any email + password', style: TextStyle( fontSize: 12, color: Colors.grey, ), ), ], ), ), ), ); } } /* ========================================================= HOME ==============================================/* =========================================================
   STORE
========================================================= */

class StorePage extends StatefulWidget {
  final Set<String> favorites;
  final Function(Product) onAddToCart;
  final Function(Product) onFavorite;

  const StorePage({
    super.key,
    required this.favorites,
    required this.onAddToCart,
    required this.onFavorite,
  });

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  String selectedCategory = 'All';
  String searchText = '';

  final List<String> categories = [
    'All',
    'Phones',
    'Watches',
    'Audio',
    'Electronics',
    'Fashion',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      final matchesCategory =
          selectedCategory == 'All' ||
          product.category == selectedCategory;

      final matchesSearch =
          product.name.toLowerCase().contains(
                searchText.toLowerCase(),
              );

      return matchesCategory && matchesSearch;
    }).toList();

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: Colors.white,
            title: const Text(
              'BuyNova',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none),
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                10,
                16,
                8,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 55,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final selected =
                      selectedCategory == category;

                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      top: 8,
                      bottom: 8,
                    ),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: selected,
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                10,
                16,
                12,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${filteredProducts.length} items',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (filteredProducts.isEmpty)
            const SliverFillRemaining(
              child: Center(
                child: Text(
                  'No products found',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          else
            SliverPadding(/* =========================================================
   CART PAGE
========================================================= */

class CartPage extends StatefulWidget {
  final List<CartItem> cart;
  final List<Address> addresses;
  final List<Order> orders;
  final VoidCallback onOrderCreated;

  const CartPage({
    super.key,
    required this.cart,
    required this.addresses,
    required this.orders,
    required this.onOrderCreated,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String formatPrice(int price) {
    return '${price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    )} ₩';
  }

  int get subtotal {
    return widget.cart.fold(
      0,
      (sum, item) => sum + item.product.price * item.quantity,
    );
  }

  int get deliveryFee {
    return subtotal == 0 ? 0 : 3000;
  }

  int get total {
    return subtotal + deliveryFee;
  }

  void increase(CartItem item) {
    setState(() {
      item.quantity++;
    });
  }

  void decrease(CartItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity--;
      } else {
        widget.cart.remove(item);
      }
    });
  }

  void checkout() {
    if (widget.cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your cart is empty'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CheckoutPage(
          cart: widget.cart,
          addresses: widget.addresses,
          orders: widget.orders,
          total: total,
        ),
      ),
    ).then((result) {
      if (result == true) {
        setState(() {});
        widget.onOrderCreated();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My Cart',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Expanded(
            child: widget.cart.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Your cart is empty',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                    ),
                    children: [
                      ...widget.cart.map(
                        (item) {
                          return Card(
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.grey.shade100,
                                      borderRadius:
                                          BorderRadius.circular(
                                        12,
                                      ),
                                    ),
                                    child: Icon(
                                      item.product.icon,
                                      size: 38,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Column(
                                      crcrossAxisAlignmen/* =========================================================
   ORDER HISTORY
========================================================= */

class OrderHistoryPage extends StatelessWidget {
  final List<Order> orders;

  const OrderHistoryPage({
    super.key,
    required this.orders,
  });

  String formatPrice(int price) {
    return '${price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    )} ₩';
  }

  String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: orders.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'No orders yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Card(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: const Icon(
                        Icons.shopping_bag,
                      ),
                    ),
                    title: Text(
                      order.id,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${order.items.length} item(s)\n'
                      '${formatDate(order.date)}\n'
                      '${order.status}',
                    ),
                    isThreeLine: true,
                    trailing: Text(
                      formatPrice(order.total),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              OrderDetailsPage(
                            order: order,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

/* =========================================================
   ORDER DETAILS
========================================================= */

class OrderDetailsPage extends StatelessWidget {
  final Order order;

  const OrderDetailsPage({
    super.key,
    required this.order,
  });

  String formatPrice(int price) {
    return '${price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    )} ₩';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text('Order ID: ${order.id}'),

                  const SizedBox(height: 6),

                  Text('Status: ${order.status}'),

                  const SizedBox(height: 6),

                  Text(
                    'Date: ${order.date.year}-'
                    '${order.date.month.toString().padLeft(2, '0')}-'
                    '${order.date.day.toString().padLeft(2, '0')}',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'Products',
            style: TextStyle(
              fontSize: 21,t
