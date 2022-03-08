import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ComputerPage extends StatefulWidget {
  const ComputerPage({Key? key}) : super(key: key);

  @override
  State<ComputerPage> createState() => _ComputerPageState();
}

class _ComputerPageState extends State<ComputerPage> {
  int sayac = 0;
  String openElectricText = "Açık";
  String closeElectricText = "Kapalı";
  final database = FirebaseDatabase.instance.ref();
  Color buttonBackgroundColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<dynamic>(
            stream: database.child('isOpen').onValue,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.snapshot.value == 1) {
                  buttonBackgroundColor = Colors.blue;
                } else {
                  buttonBackgroundColor = Colors.black;
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (snapshot.data!.snapshot.value == 1)
                        Text(
                          openElectricText,
                          style: const TextStyle(
                              fontFamily: "SansitaSwashed",
                              fontWeight: FontWeight.bold,
                              fontSize: 48),
                        ),
                      if (snapshot.data!.snapshot.value == 0)
                        Text(
                          closeElectricText,
                          style: const TextStyle(
                              fontFamily: "SansitaSwashed",
                              fontWeight: FontWeight.bold,
                              fontSize: 48),
                        ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: FloatingActionButton(
                          child: Image.asset(
                              "assets/images/power_point_switch_image.png"),
                          backgroundColor: buttonBackgroundColor,
                          onPressed: () {
                            sayac++;
                            if (sayac % 2 == 0) {
                              database.child('isOpen').set(1);
                            } else if (sayac % 2 == 1) {
                              database.child('isOpen').set(0);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator()),
                );
              }
            }),
      ),
    );
  }
}
