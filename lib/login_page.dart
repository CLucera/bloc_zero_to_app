import 'package:bloc_zero_to_app/shopping_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Smart Cart",
                      style: Theme.of(context).textTheme.displaySmall,
                    ))),
            Expanded(
              flex: 3,
              child: FittedBox(
                  child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.shopping_cart_outlined),
              )),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ShoppingPage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32),
                    child: Text("LOGIN"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
