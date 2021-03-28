import 'package:conversor_moeda/app/components/currency_box.dart';
import 'package:conversor_moeda/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController;

  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 20),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/logo.jpg',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 30),
            CurrencyBox(
              selectedItem: homeController.toCurrency,
              controller: toText,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model;
                });
              },
            ),
            SizedBox(height: 10),
            CurrencyBox(
                selectedItem: homeController.fromCurrency,
                controller: fromText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model;
                  });
                }),
            SizedBox(height: 10),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  homeController.convert();
                },
                child: Text('Converter'))
          ]),
        ),
      ),
    );
  }
}
