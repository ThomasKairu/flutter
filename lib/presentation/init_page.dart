// ignore_for_file: use_build_context_synchronously

import 'package:angel_fetus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  static Widget builder(BuildContext context) {
    return const InitPage();
  }

  @override
  Widget build(BuildContext context) {
    return const MyHome();
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  MyHomeState createState() => MyHomeState();
}

class DatabaseService {
  
  Future<void> savePregnancyData(
    DateTime selectedDate,
    DateTime dueDate,
    int pregnancyWeek,
  ) async {
   
  }
}

class MyHomeState extends State<MyHome> {
  final DatabaseService _databaseService = DatabaseService();
  DateTime? selectedDate;
  DateTime? dueDate;

  void calculateDueDate(DateTime lastPeriodStart) {
    setState(() {
      dueDate = lastPeriodStart.add(const Duration(days: 40 * 7));
    });
  }

  int calculatePregnancyWeek(DateTime dueDate) {
    final currentDate = DateTime.now();
    final differenceInDays = dueDate.difference(currentDate).inDays;
    final differenceInWeeks = ((40 * 7 - differenceInDays) / 7).ceil();
    return differenceInWeeks;
  }

  @override
  Widget build(BuildContext context) {
    int? pregnancyWeek;
    if (dueDate != null) {
      pregnancyWeek = calculatePregnancyWeek(dueDate!);
    }

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 223, 226),
        child: WelcomeMessage(
          onSelectDate: (newSelectedDate) {
            setState(() {
              selectedDate = newSelectedDate;
              if (selectedDate != null) {
                calculateDueDate(selectedDate!);
              }
            });
          },
          dueDate: dueDate,
          selectedDate: selectedDate,
          pregnancyWeek: pregnancyWeek,
          databaseService: _databaseService,
        ),
      ),
    );
  }
}

Future<bool> checkIfDataExists() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('selectedDate') &&
      prefs.containsKey('dueDate') &&
      prefs.containsKey('pregnancyWeek');
}

class WelcomeMessage extends StatelessWidget {
  final Function(DateTime)? onSelectDate;
  final DateTime? dueDate;
  final DateTime? selectedDate;
  final int? pregnancyWeek;
  final DatabaseService databaseService;

  const WelcomeMessage({
    super.key,
    this.onSelectDate,
    this.dueDate,
    this.selectedDate,
    this.pregnancyWeek,
    required this.databaseService,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 28, top: 50),
          child: Text(
            "Welcome to",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: Color.fromARGB(255, 67, 67, 67),
            ),
          ),
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 28),
              child: Text(
                "Angel ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromARGB(255, 67, 67, 67),
                ),
              ),
            ),
            Text(
              "Fetus",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(255, 255, 146, 146),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\nSELECT WHEN LAST PERIOD",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFFF4716A),
                  ),
                ),
                Text(
                  "\n STARTED",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color.fromARGB(255, 66, 66, 66),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 31, 32, 35)),
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(200, 48),
                ),
              ),
              onPressed: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2025),
                );
                if (selectedDate != null) {
                  onSelectDate!(selectedDate);
                }
              },
              child: Text(
                selectedDate != null
                    ? DateFormat('d MMM yyyy').format(selectedDate!)
                    : 'Select Date',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            if (dueDate != null)
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 280,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 153, 146),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "DUE DATE ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 153, 146),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: 15,
                        right: 15,
                      ),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 153, 146),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        DateFormat('d MMM yyyy').format(dueDate!),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (dueDate != null)
              Container(
                width: 320,
                height: 80,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 236, 234),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 3,
                    color: const Color.fromARGB(255, 78, 149, 102),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Congratulation !",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 54, 110, 57)),
                    ),
                    Visibility(
                      visible: pregnancyWeek != null,
                      child: Text(
                        'you are $pregnancyWeek weeks pregnant',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 54, 110, 57)),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
        if (dueDate != null)
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 31, 32, 35)),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(340, 55),
                  ),
                ),
                onPressed: () async {
                  try {
                    await databaseService.savePregnancyData(
                        selectedDate!, dueDate!, pregnancyWeek ?? 0);

                  
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('selectedDate', selectedDate.toString());
                    prefs.setString('dueDate', dueDate.toString());
                    prefs.setInt('pregnancyWeek', pregnancyWeek ?? 0);

                    // Navigate to the home page
                    Navigator.pushReplacementNamed(context, AppRoutes.homePage,
                        arguments: dueDate);
                  } catch (e) {
                    // Handle the error
                    SnackBar(
                      content: Text('Error saving pregnancy data: $e'),
                      duration: const Duration(seconds: 3),
                    );
                  }
                },
                child: const Text("Save & Proceed",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ),
      ],
    );
  }
}
