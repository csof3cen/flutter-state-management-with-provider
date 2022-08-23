import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/home_screen/home_screen.dart';
import 'package:state_management_with_provider/models/product_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ProductModel>(
      create: (context) => ProductModel.empty(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
