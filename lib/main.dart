import 'package:engage_library/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await GetStorage.init();
  // await Analytics.init();
  // if (GetPlatform.isAndroid || Analytics.isEnabled) {
  //   await MobileAds.instance.initialize();
  // }
  // UserController.loginAnonAccount();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return GetMaterialApp(
      navigatorKey: Get.key,
      title: 'EarnIt',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      // themeMode: ThemeMode.system,
      themeMode: ThemeMode.dark,
      // theme: ThemeData(
      //   primarySwatch: Colors.deepPurple,
      // ),
      getPages: AppRoutes.routes,
      initialRoute: auth.currentUser != null ? "/" : "/login",
      // navigatorObservers: [
      //   BotToastNavigatorObserver(),
      //   FirebaseAnalyticsObserver(analytics: Analytics.analytics)
      // ],
      // builder: BotToastInit(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    EngageHomeScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_copy),
            label: 'Templates',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }
}
