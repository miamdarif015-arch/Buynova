import 'package:flutter/material.dart';

void main() {
  runApp(const BuyNovaApp());
}

class Product {
  final String name;
  final int price;
  final String category;
  final IconData icon;
  final double rating;

  const Product({
    required this.name,
    required this.price,
    required this.category,
    required this.icon,
    this.rating = 4.5,
  });
}

const products = [
  Product(
    name: 'Smart Phone',
    price: 499000,
    category: 'Phones',
    icon: Icons.phone_android,
    rating: 4.8,
  ),
  Product(
    name: 'Smart Watch',
    price: 39900,
    category: 'Watches',
    icon: Icons.watch,
    rating: 4.6,
  ),
  Product(
    name: 'Wireless Earbuds',
    price: 29900,
    category: 'Audio',
    icon: Icons.headphones,
    rating: 4.7,
  ),
  Product(
    name: 'Laptop',
    price: 899000,
    category: 'Electronics',
    icon: Icons.laptop,
    rating: 4.9,
  ),
  Product(
    name: 'Camera',
    price: 299000,
    category: 'Electronics',
    icon: Icons.camera_alt,
    rating: 4.6,
  ),
  Product(
    name: 'Backpack',
    price: 24900,
    category: 'Fashion',
    icon: Icons.backpack,
    rating: 4.4,
  ),
];

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class Order {
  final List<CartItem> items;
  final int total;
  final String address;
  final DateTime date;
  String status;

  Order({
    required this.items,
    required this.total,
    required this.address,
    required this.date,
    this.status = 'Order Placed',
  });
}

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

/* ================= LOGIN ================= */

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool showPassword = false;

  void login() {
    if (email.text.isEmpty || password.text.isEmpty) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 45),

              const CircleAvatar(
                radius: 52,
                child: Icon(
                  Icons.shopping_bag,
                  size: 58,
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
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon:
                      const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              TextField(
                controller: password,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon:
                      const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignUpPage(),
                    ),
                  );
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ================= SIGN UP ================= */

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  bool showPassword = false;

  void createAccount() {
    if (name.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('সব তথ্য পূরণ করুন'),
        ),
      );
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                'Join BuyNova',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon:
                      const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon:
                      const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              TextField(
                controller: password,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon:
                      const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: createAccount,
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ================= HOME ================= */

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CartItem> cart = [];
  final List<Order> orders = [];
  final Set<String> favorites = {};

  String category = 'All';
  String search = '';
  String address = '';
  int bottomIndex = 0;

  int get cartCount {
    return cart.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
  }

  List<Product> get filteredProducts {
    return products.where((product) {
      final categoryMatch =
          category == 'All' ||
          product.category == category;

      final searchMatch = product.name
          .toLowerCase()
          .contains(search.toLowerCase());

      return categoryMatch && searchMatch;
    }).toList();
  }

  void addToCart(Product product) {
    setState(() {
      final index = cart.indexWhere(
        (item) => item.product.name == product.name,
      );

      if (index == -1) {
        cart.add(
          CartItem(product: product),
        );
      } else {
        cart[index].quantity++;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to Cart 🛒'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void toggleFavorite(Product product) {
    setState(() {
      if (favorites.contains(product.name)) {
        favorites.remove(product.name);
      } else {
        favorites.add(product.name);
      }
    });
  }

  void openProduct(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailsPage(
          product: product,
          isFavorite:
              favorites.contains(product.name),
          onFavorite: () {
            toggleFavorite(product);
            setState(() {});
          },
          onAdd: () => addToCart(product),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BuyNova',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    bottomIndex = 2;
                  });
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
              if (cartCount > 0)
                Positioned(
                  right: 5,
                  top: 5,
                  child: CircleAvatar(
                    radius: 9,
                    child: Text(
                      '$cartCount',
                      style:
                          const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: bottomIndex,
        onDestinationSelected: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (bottomIndex == 1) {
      final favoriteProducts = products
          .where(
            (p) => favorites.contains(p.name),
          )
          .toList();

      if (favoriteProducts.isEmpty) {
        return const Center(
          child: Text(
            'No Favorite Products ❤️',
            style: TextStyle(fontSize: 20),
          ),
        );
      }

      return ProductGrid(
        products: favoriteProducts,
        favorites: favorites,
        onFavorite: toggleFavorite,
        onAdd: addToCart,
        onOpen: openProduct,
      );
    }

    if (bottomIndex == 2) {
      return CartPage(
        cart: cart,
        address: address,
        onAddressChanged: (value) {
          setState(() {
            address = value;
          });
        },
        onOrderPlaced: (order) {
          setState(() {
            orders.insert(0, order);
            cart.clear();
          });
        },
      );
    }

    if (bottomIndex == 3) {
      return ProfilePage(
        address: address,
        orders: orders,
        onAddressChanged: (value) {
          setState(() {
            address = value;
          });
        },
        onLogout: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const LoginPage(),
            ),
            (route) => false,
          );
        },
      );
    }

    return _homeContent();
  }

  Widget _homeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                search = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon:
                  const Icon(Icons.search),
              filled: true,
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.indigo,
                ],
              ),
            ),
            child: const Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'BUY NOVA',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Big Deals Today!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Shop your favorite products',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection:
                  Axis.horizontal,
              children: [
                _categoryButton(
                  'All',
                  Icons.apps,
                ),
                _categoryButton(
                  'Phones',
                  Icons.phone_android,
                ),
                _categoryButton(
                  'Watches',
                  Icons.watch,
                ),
                _categoryButton(
                  'Audio',
                  Icons.headphones,
                ),
                _categoryButton(
                  'Fashion',
                  Icons.backpack,
                ),
                _categoryButton(
                  'Electronics',
                  Icons.devices,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Text(
            category == 'All'
                ? 'Popular Products'
                : category,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          ProductGrid(
            products: filteredProducts,
            favorites: favorites,
            onFavorite: toggleFavorite,
            onAdd: addToCart,
            onOpen: openProduct,
          ),
        ],
      ),
    );
  }

  Widget _categoryButton(
    String name,
    IconData icon,
  ) {
    final selected = category == name;

    return GestureDetector(
      onTap: () {
        setState(() {
          category = name;
        });
      },
      child: Container(
        width: 90,
        margin:
            const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor:
                  selected
                      ? Colors.blue
                      : Colors.blue.shade50,
              child: Icon(
                icon,
                color:
                    selected
                        ? Colors.white
                        : Colors.blue,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              name,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= PRODUCT GRID ================= */

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final Set<String> favorites;
  final Function(Product) onFavorite;
  final Function(Product) onAdd;
  final Function(Product) onOpen;

  const ProductGrid({
    super.key,
    required this.products,
    required this.favorites,
    required this.onFavorite,
    required this.onAdd,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Text(
            'No products found',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return Card(
          clipBehavior:
              Clip.antiAlias,
          child: InkWell(
            onTap: () => onOpen(product),
            child: Padding(
              padding:
                  const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration:
                              BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(
                                    15),
                            color: Colors.blue
                                .withOpacity(0.08),
                          ),
                          child: Icon(
                            product.icon,
                            size: 65,
                            color: Colors.blue,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: IconButton(
                            onPressed: () =>
                                onFavorite(product),
                            icon: Icon(
                              favorites.contains(
                                      product.name)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.name,
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 17,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${product.rating}',
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '₩${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 7),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          onAdd(product),
                      child:
                          const Text('Add to Cart'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/* ================= PRODUCT DETAILS ================= */

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onAdd;

  const ProductDetailsPage({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavorite,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Product Details'),
        actions: [
          IconButton(
            onPressed: onFavorite,
            icon: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration:
                  BoxDecoration(
                borderRadius:
                    BorderRadius.circular(25),
                color:
                    Colors.blue.withOpacity(0.08),
              ),
              child: Icon(
                product.icon,
                size: 130,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const SizedBox(width: 5),
                Text(
                  '${product.rating} / 5',
                  style:
                      const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              '₩${product.price}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Product Description',
              style: TextStyle(
                fontSize: 19,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'High-quality product from BuyNova. '
              'Enjoy great value, trusted quality '
              'and a simple shopping experience.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child:
                  ElevatedButton.icon(
                onPressed: onAdd,
                icon: const Icon(
                    Icons.shopping_cart),
                label: const Text(
                  'Add to Cart',
                  style:
                      TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= PART 2 WILL CONTINUE ================= *//* ================= CART PAGE ================= */

class CartPage extends StatefulWidget {
  final List<CartItem> cart;
  final String address;
  final Function(String) onAddressChanged;
  final Function(Order) onOrderPlaced;

  const CartPage({
    super.key,
    required this.cart,
    required this.address,
    required this.onAddressChanged,
    required this.onOrderPlaced,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String coupon = '';
  int discount = 0;

  int get subtotal {
    return widget.cart.fold(
      0,
      (sum, item) =>
          sum + item.product.price * item.quantity,
    );
  }

  int get delivery {
    return subtotal >= 100000 ? 0 : 3000;
  }

  int get total {
    final value = subtotal + delivery - discount;
    return value < 0 ? 0 : value;
  }

  void applyCoupon() {
    final code = coupon.trim().toUpperCase();

    setState(() {
      if (code == 'BUY10') {
        discount = (subtotal * 0.10).round();
      } else if (code == 'NOVA5000') {
        discount = 5000;
      } else {
        discount = 0;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          discount > 0
              ? 'Coupon applied 🎉'
              : 'Invalid coupon',
        ),
      ),
    );
  }

  void addAddress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddressPage(
          currentAddress: widget.address,
          onSave: widget.onAddressChanged,
        ),
      ),
    );
  }

  void checkout() {
    if (widget.cart.isEmpty) return;

    if (widget.address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'আগে Delivery Address যোগ করুন',
          ),
        ),
      );
      addAddress();
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CheckoutPage(
          cart: widget.cart,
          address: widget.address,
          total: total,
          onConfirm: (paymentMethod) {
            final copiedItems = widget.cart
                .map(
                  (item) => CartItem(
                    product: item.product,
                    quantity: item.quantity,
                  ),
                )
                .toList();

            final order = Order(
              items: copiedItems,
              total: total,
              address: widget.address,
              date: DateTime.now(),
              status: 'Order Placed',
            );

            widget.onOrderPlaced(order);

            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Order placed with $paymentMethod 🎉',
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cart.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 90,
            ),
            SizedBox(height: 15),
            Text(
              'Your Cart is Empty',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: widget.cart.length,
            itemBuilder: (context, index) {
              final item = widget.cart[index];

              return Card(
                margin:
                    const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(item.product.icon),
                  ),
                  title: Text(
                    item.product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '₩${item.product.price}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            } else {
                              widget.cart.removeAt(index);
                            }
                          });
                        },
                        icon:
                            const Icon(Icons.remove),
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                        icon:
                            const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        Container(
          padding: const EdgeInsets.fromLTRB(
            18,
            10,
            18,
            18,
          ),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black12,
              ),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        coupon = value;
                      },
                      decoration:
                          const InputDecoration(
                        hintText:
                            'Coupon code',
                        prefixIcon:
                            Icon(Icons.discount),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: applyCoupon,
                    child: const Text('Apply'),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              if (widget.address.isNotEmpty)
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.location_on,
                    ),
                    title: const Text(
                      'Delivery Address',
                    ),
                    subtitle:
                        Text(widget.address),
                    trailing: IconButton(
                      onPressed: addAddress,
                      icon:
                          const Icon(Icons.edit),
                    ),
                  ),
                )
              else
                OutlinedButton.icon(
                  onPressed: addAddress,
                  icon: const Icon(
                    Icons.location_on,
                  ),
                  label: const Text(
                    'Add Delivery Address',
                  ),
                ),

              const SizedBox(height: 8),

              _summaryRow(
                'Subtotal',
                '₩$subtotal',
              ),
              _summaryRow(
                'Delivery',
                delivery == 0
                    ? 'FREE'
                    : '₩$delivery',
              ),

              if (discount > 0)
                _summaryRow(
                  'Discount',
                  '-₩$discount',
                ),

              const Divider(),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  Text(
                    '₩$total',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: checkout,
                  icon:
                      const Icon(Icons.payment),
                  label: const Text(
                    'Checkout',
                    style:
                        TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _summaryRow(
    String title,
    String value,
  ) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}

/* ================= ADDRESS PAGE ================= */

class AddressPage extends StatefulWidget {
  final String currentAddress;
  final Function(String) onSave;

  const AddressPage({
    super.key,
    required this.currentAddress,
    required this.onSave,
  });

  @override
  State<AddressPage> createState() =>
      _AddressPageState();
}

class _AddressPageState
    extends State<AddressPage> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.currentAddress.isNotEmpty) {
      final parts =
          widget.currentAddress.split('\n');

      if (parts.isNotEmpty) {
        name.text = parts[0];
      }

      if (parts.length > 1) {
        phone.text = parts[1];
      }

      if (parts.length > 2) {
        address.text = parts.sublist(2).join('\n');
      }
    }
  }

  void save() {
    if (name.text.trim().isEmpty ||
        phone.text.trim().isEmpty ||
        address.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'সব তথ্য পূরণ করুন',
          ),
        ),
      );
      return;
    }

    final fullAddress =
        '${name.text.trim()}\n'
        '${phone.text.trim()}\n'
        '${address.text.trim()}';

    widget.onSave(fullAddress);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text('Address saved successfully 📍'),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Delivery Address'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            const CircleAvatar(
              radius: 42,
              child: Icon(
                Icons.location_on,
                size: 45,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: name,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon:
                    Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: phone,
              keyboardType:
                  TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixIcon:
                    Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: address,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText:
                    'Full Delivery Address',
                prefixIcon:
                    Icon(Icons.home),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: save,
                icon:
                    const Icon(Icons.save),
                label: const Text(
                  'Save Address',
                  style:
                      TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= CHECKOUT ================= */

class CheckoutPage extends StatefulWidget {
  final List<CartItem> cart;
  final String address;
  final int total;
  final Function(String) onConfirm;

  const CheckoutPage({
    super.key,
    required this.cart,
    required this.address,
    required this.total,
    required this.onConfirm,
  });

  @override
  State<CheckoutPage> createState() =>
      _CheckoutPageState();
}

class _CheckoutPageState
    extends State<CheckoutPage> {
  String payment = 'Cash on Delivery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Checkout'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          ...widget.cart.map(
            (item) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  child:
                      Icon(item.product.icon),
                ),
                title:
                    Text(item.product.name),
                subtitle:
                    Text('Qty: ${item.quantity}'),
                trailing: Text(
                  '₩${item.product.price * item.quantity}',
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.location_on,
              ),
              title: const Text(
                'Delivery Address',
              ),
              subtitle:
                  Text(widget.address),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Payment Method',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          RadioListTile<String>(
            value: 'Cash on Delivery',
            groupValue: payment,
            onChanged: (value) {
              setState(() {
                payment = value!;
              });
            },
            title:
                const Text('Cash on Delivery'),
            secondary:
                const Icon(Icons.money),
          ),

          RadioListTile<String>(
            value: 'Demo Card Payment',
            groupValue: payment,
            onChanged: (value) {
              setState(() {
                payment = value!;
              });
            },
            title:
                const Text('Card Payment'),
            secondary:
                const Icon(Icons.credit_card),
          ),

          RadioListTile<String>(
            value: 'Demo Bank Payment',
            groupValue: payment,
            onChanged: (value) {
              setState(() {
                payment = value!;
              });
            },
            title:
                const Text('Bank Payment'),
            secondary:
                const Icon(Icons.account_balance),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(18),
              color:
                  Colors.blue.withOpacity(0.08),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                Text(
                  '₩${widget.total}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () {
                widget.onConfirm(payment);
              },
              icon: const Icon(
                  Icons.check_circle),
              label: const Text(
                'Confirm Order',
                style:
                    TextStyle(fontSize: 17),
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            '⚠️ Payment options are Demo only. '
            'Real payment will be connected later.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

/* ================= ORDER HISTORY ================= */

class OrderHistoryPage extends StatelessWidget {
  final List<Order> orders;

  const OrderHistoryPage({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Order History'),
      ),
      body: orders.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long,
                    size: 80,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'No Orders Yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.all(15),
              itemCount: orders.length,
              itemBuilder:
                  (context, index) {
                final order =
                    orders[index];

                return OrderCard(
                  order: order,
                  index: index,
                );
              },
            ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  final int index;

  const OrderCard({
    super.key,
    required this.order,
    required this.index,
  });

  Color statusColor() {
    switch (order.status) {
      case 'Delivered':
        return Colors.green;
      case 'Shipped':
        return Colors.orange;
      case 'Confirmed':
        return Colors.blue;
      default:
        return Colors.indigo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding:
            const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #${index + 1001}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(20),
                    color: statusColor()
                        .withOpacity(0.12),
                  ),
                  child: Text(
                    order.status,
                    style: TextStyle(
                      color: statusColor(),
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(),

            ...order.items.map(
              (item) => ListTile(
                contentPadding:
                    EdgeInsets.zero,
                leading: CircleAvatar(
                  child:
                      Icon(item.product.icon),
                ),
                title:
                    Text(item.product.name),
                subtitle:
                    Text('Qty: ${item.quantity}'),
                trailing: Text(
                  '₩${item.product.price * item.quantity}',
                ),
              ),
            ),

            const Divider(),

            Text(
              'Total: ₩${order.total}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Address: ${order.address}',
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          OrderTrackingPage(
                        order: order,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                    Icons.local_shipping),
                label: const Text(
                  'Track Order',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= ORDER TRACKING ================= */

class OrderTrackingPage extends StatelessWidget {
  final Order order;

  const OrderTrackingPage({
    super.key,
    required this.order,
  });

  int currentStep() {
    switch (order.status) {
      case 'Confirmed':
        return 1;
      case 'Shipped':
        return 2;
      case 'Delivered':
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final step = currentStep();

    final steps = [
      [
        Icons.receipt_long,
        'Order Placed',
        'Your order has been received',
      ],
      [
        Icons.check_circle,
        'Confirmed',
        'Seller confirmed your order',
      ],
      [
        Icons.local_shipping,
        'Shipped',
        'Your order is on the way',
      ],
      [
        Icons.home,
        'Delivered',
        'Order delivered successfully',
      ],
    ];

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Track Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.local_shipping,
              size: 85,
            ),

            const SizedBox(height: 15),

            const Text(
              'Your Order',
              style: TextStyle(
                fontSize: 25,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  final completed =
                      index <= step;

                  return ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        steps[index][0]
                            as IconData,
                      ),
                    ),
                    title: Text(
                      steps[index][1]
                          as String,
                      style: TextStyle(
                        fontWeight:
                            completed
                                ? FontWeight.bold
                                : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text(
                      steps[index][2]
                          as String,
                    ),
                    trailing:
                        completed
                            ? const Icon(
                                Icons.check_circle,
                                color:
                                    Colors.green,
                              )
                            : const Icon(
                                Icons
                                    .radio_button_unchecked,
                              ),
                  );
                },
              ),
            ),

            Text(
              'Current Status: ${order.status}',
              style: const TextStyle(
                fontSize: 19,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= PART 3 WILL CONTINUE ================= *//* ================= PROFILE ================= */

class ProfilePage extends StatelessWidget {
  final String address;
  final List<Order> orders;
  final Function(String) onAddressChanged;
  final VoidCallback onLogout;

  const ProfilePage({
    super.key,
    required this.address,
    required this.orders,
    required this.onAddressChanged,
    required this.onLogout,
  });

  void openAddress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddressPage(
          currentAddress: address,
          onSave: onAddressChanged,
        ),
      ),
    );
  }

  void openOrders(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrderHistoryPage(
          orders: orders,
        ),
      ),
    );
  }

  void openSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SettingsPage(),
      ),
    );
  }

  void openAdmin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AdminPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 15),

        const Center(
          child: CircleAvatar(
            radius: 55,
            child: Icon(
              Icons.person,
              size: 60,
            ),
          ),
        ),

        const SizedBox(height: 15),

        const Center(
          child: Text(
            'BuyNova User',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const Center(
          child: Text(
            'Welcome to BuyNova',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),

        const SizedBox(height: 30),

        Card(
          child: ListTile(
            leading: const Icon(
              Icons.location_on,
            ),
            title: const Text(
              'Delivery Address',
            ),
            subtitle: Text(
              address.isEmpty
                  ? 'No address added'
                  : address,
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
            onTap: () =>
                openAddress(context),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(
              Icons.receipt_long,
            ),
            title: const Text(
              'Order History',
            ),
            subtitle: Text(
              '${orders.length} order(s)',
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
            onTap: () =>
                openOrders(context),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(
              Icons.admin_panel_settings,
            ),
            title: const Text(
              'Admin Panel',
            ),
            subtitle: const Text(
              'Demo product management',
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
            onTap: () =>
                openAdmin(context),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              'Settings',
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
            onTap: () =>
                openSettings(context),
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          height: 54,
          child: ElevatedButton.icon(
            onPressed: onLogout,
            icon: const Icon(
              Icons.logout,
            ),
            label: const Text(
              'Logout',
            ),
          ),
        ),
      ],
    );
  }
}

/* ================= SETTINGS ================= */

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState
    extends State<SettingsPage> {
  bool notifications = true;
  bool darkMode = false;
  String language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const ListTile(
            leading:
                Icon(Icons.settings),
            title: Text(
              'App Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

          SwitchListTile(
            secondary: const Icon(
              Icons.notifications,
            ),
            title:
                const Text('Notifications'),
            subtitle: const Text(
              'Receive order updates',
            ),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(
              Icons.dark_mode,
            ),
            title:
                const Text('Dark Mode'),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                SnackBar(
                  content: Text(
                    value
                        ? 'Dark Mode selected'
                        : 'Light Mode selected',
                  ),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            leading:
                const Icon(Icons.language),
            title:
                const Text('Language'),
            subtitle:
                Text(language),
            trailing:
                const Icon(Icons.chevron_right),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return SafeArea(
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.all(18),
                          child: Text(
                            'Select Language',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                        _languageOption(
                          'English',
                        ),
                        _languageOption(
                          'বাংলা',
                        ),
                        _languageOption(
                          '한국어',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          ListTile(
            leading:
                const Icon(Icons.info_outline),
            title:
                const Text('About BuyNova'),
            subtitle:
                const Text('Version 1.0.0 Demo'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName:
                    'BuyNova',
                applicationVersion:
                    '1.0.0',
                applicationLegalese:
                    'BuyNova Demo Shopping App',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _languageOption(String value) {
    return ListTile(
      title: Text(value),
      trailing: language == value
          ? const Icon(
              Icons.check,
            )
          : null,
      onTap: () {
        setState(() {
          language = value;
        });

        Navigator.pop(context);
      },
    );
  }
}

/* ================= ADMIN PANEL ================= */

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() =>
      _AdminPageState();
}

class _AdminPageState
    extends State<AdminPage> {
  final List<Map<String, dynamic>> adminProducts =
      products
          .map(
            (p) => {
              'name': p.name,
              'price': p.price,
              'category': p.category,
              'icon': p.icon,
            },
          )
          .toList();

  void addProduct() {
    final name =
        TextEditingController();
    final price =
        TextEditingController();
    final category =
        TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title:
              const Text('Add Product'),
          content: Column(
            mainAxisSize:
                MainAxisSize.min,
            children: [
              TextField(
                controller: name,
                decoration:
                    const InputDecoration(
                  labelText:
                      'Product Name',
                ),
              ),
              TextField(
                controller: price,
                keyboardType:
                    TextInputType.number,
                decoration:
                    const InputDecoration(
                  labelText:
                      'Price',
                ),
              ),
              TextField(
                controller: category,
                decoration:
                    const InputDecoration(
                  labelText:
                      'Category',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(context),
              child:
                  const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (name.text.isEmpty ||
                    price.text.isEmpty) {
                  return;
                }

                setState(() {
                  adminProducts.add({
                    'name': name.text,
                    'price':
                        int.tryParse(
                              price.text,
                            ) ??
                            0,
                    'category':
                        category.text.isEmpty
                            ? 'Other'
                            : category.text,
                    'icon':
                        Icons.shopping_bag,
                  });
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Product added 🎉',
                    ),
                  ),
                );
              },
              child:
                  const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void deleteProduct(int index) {
    setState(() {
      adminProducts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Admin Panel'),
        actions: [
          IconButton(
            onPressed: addProduct,
            icon:
                const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: addProduct,
        icon:
            const Icon(Icons.add),
        label:
            const Text('Add Product'),
      ),
      body: ListView.builder(
        padding:
            const EdgeInsets.all(15),
        itemCount:
            adminProducts.length,
        itemBuilder:
            (context, index) {
          final item =
              adminProducts[index];

          return Card(
            margin:
                const EdgeInsets.only(
                    bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  item['icon']
                      as IconData,
                ),
              ),
              title: Text(
                item['name'] as String,
                style:
                    const TextStyle(
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${item['category']} • ₩${item['price']}',
              ),
              trailing: IconButton(
                onPressed: () =>
                    deleteProduct(index),
                icon: const Icon(
                  Icons.delete_outline,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/* ================= DEMO PAYMENT ================= */

class PaymentSuccessPage
    extends StatelessWidget {
  final int amount;

  const PaymentSuccessPage({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 55,
                child: Icon(
                  Icons.check,
                  size: 65,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Payment Successful!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Amount: ₩$amount',
                style:
                    const TextStyle(
                  fontSize: 19,
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width:
                    double.infinity,
                height: 52,
                child:
                    ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context);
                  },
                  child:
                      const Text(
                    'Done',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ================= END ================= */
