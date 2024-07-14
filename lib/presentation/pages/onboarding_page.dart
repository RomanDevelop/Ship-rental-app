import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/pages/ship_list_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD85C35), // Updated top color
              Color(0xFF194A91), // Updated bottom color
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 170,
            ),
            const Text(
              'AMASUS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 240, // Adjust this value to control the image height
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/onboarding.png'),
                        fit: BoxFit.contain)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Premium ships \nEnjoy the luxury',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Amasus is able to select the right \nvessel for every cargo and route.',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 320,
                    height: 54,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => ShipListScreen()),
                              (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white),
                        child: const Text(
                          'Drop Cargo',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(height: 20), // Adding a bit of bottom spacing
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
