import 'package:angel_fetus/presentation/profile/profile_screen.dart';
import 'package:angel_fetus/presentation/trackingtools/library.dart';
import 'package:angel_fetus/presentation/trackingtools/tracking_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  final DateTime dueDate;

  const HomePage({
    super.key,
    required this.dueDate,
  });

  static Widget builder(BuildContext context) {
    return HomePage(dueDate: DateTime.now());
  }

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late int _pregnancyWeek;
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _calculatePregnancyWeek();
    _initializeNotificationListener();
  }

  void _initializeNotificationListener() {
    const androidInitialize =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSInitialize = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iOSInitialize,
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Handle notification response, including date/time changes
        _updateCalculations();
      },
    );
  }

  void _updateCalculations() {
    setState(() {
      _calculatePregnancyWeek();
    });
  }

  void _calculatePregnancyWeek() {
    final currentDate = DateTime.now();
    final differenceInDays = widget.dueDate.difference(currentDate).inDays;
    _pregnancyWeek = ((40 * 7 - differenceInDays) / 7).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF9690),
                        Color(0xFFA53A2D),
                      ],
                    ),
                  ),
                  child: const FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      '',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                expandedHeight: 200,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(120),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        Text(
                          'Week $_pregnancyWeek',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: CircularProgressIndicator(
                            value: (_pregnancyWeek - 1) / 40,
                            backgroundColor: const Color(0xFF9A3D37),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFFFFFFF),
                            ),
                            strokeWidth: 8,
                          ),
                        ),
                        Text(
                          '+${(widget.dueDate.difference(DateTime.now()).inDays / 7).floor()} day',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${_pregnancyWeek ~/ 4} Month ${_pregnancyWeek % 4} weeks DONE',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              '${(40 - _pregnancyWeek) * 7} DAYS TO GO',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        // Navigate to "For Partner and loved ones" section
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: const Color(0xFFFEE5E5),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'For Partner and loved ones',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Add other content sections here
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
             
              break;
            case 1:
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TrackingTools()),
              );
              break;
            case 2:
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Library()),
              );
              break;
            case 3:
         
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
              break;
            default:
           
          }
        },
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black38,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_repair_service,
              color: Colors.black38,
            ),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books,
              color: Colors.black38,
            ),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black38,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
