import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'pet_naming.dart';

class PetTypeSelectionClass extends StatelessWidget {
  const PetTypeSelectionClass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PetTypeSelection(),
    );
  }
}

final petController = ValueNotifier(TextEditingValue);

Future<void> writeBird(String selection) async {}

class PetTypeSelection extends StatefulWidget {
  const PetTypeSelection({Key? key}) : super(key: key);

  @override
  _PetTypeSelectionState createState() => _PetTypeSelectionState();
}

class _PetTypeSelectionState extends State<PetTypeSelection> {
  CarouselController buttonCarouselController = CarouselController();

  TextEditingController

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            CarouselSlider(
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                //1st Image of Slider
                InkWell(
                  onTap: () {
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PetNaming()));
                  },
                  splashColor: Colors.purple,
                  child: const Image(image: AssetImage('images/birb.jpg')),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PetNaming()));
                  },
                  splashColor: Colors.purple,
                  child: const Image(image: AssetImage('images/cat.jpg')),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PetNaming()));
                  },
                  splashColor: Colors.purple,
                  child: const Image(image: AssetImage('images/dog.jpg')),
                ),
              ],
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
              ),
            ),
            ElevatedButton(
              onPressed: () => buttonCarouselController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear),
              child: const Text('→'),
            )
          ]));
}
