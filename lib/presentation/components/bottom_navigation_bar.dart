import 'package:flutter/material.dart';
import 'package:state_management_with_provider/presentation/screens/checkout_screen/checkout_screen.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[200],
      onTap: (value) {
        if (value == 0) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return const CheckoutScreen();
            },
          ),
        );
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Checkout"),
      ],
    );
  }
}
