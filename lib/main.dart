import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: FirebaseOptions(
     apiKey: 'AIzaSyC-EJ3PqNdhsnXXS8dVcf8bTuHUtCNC_UQ',
     appId: '1:1072708774595:android:af3c5c7abd1985ff595076',
     messagingSenderId: '1072708774595',
     projectId: 'helptube-b5aca',
   ),
 );
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return GetMaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      title: "Daily Sales Record",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.teal,
          labelColor: Colors.teal
        )
      ),
    );
  }
}

