// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:auth/common/LoginScreen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(App());
// }

// class App extends StatelessWidget {
//   // Create the initialization Future outside of `build`:
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return Center(
//             child: Text('Could not load app'),
//           );
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MaterialApp(
//             title: 'Phone Verification',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//                 primaryColor: Colors.yellow,
//                 primarySwatch: Colors.yellow,
//                 inputDecorationTheme: InputDecorationTheme(
//                     labelStyle: TextStyle(color: Colors.grey)),
//                 backgroundColor: Colors.white),
//             home: LoginScreen(),
//           );
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   CircularProgressIndicator(
//                     backgroundColor: Theme.of(context).primaryColor,
//                   )
//                 ],
//               )
//             ]);
//       },
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'RBAC/usrmgnt.dart';

//global notification initialization
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "high_importance_channel", //id
    "High Importance Notifications", //title
    //'This channel is used for important notifications.', //description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A big Message just showed up: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
//notification handler cases
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//implementation de notif plugin
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

//for local notification and messaging
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // return MultiProvider(
      //   providers: [
      //     Provider<AuthenticationProvider>(
      //       create: (_) => AuthenticationProvider(FirebaseAuth.instance),
      //     ),
      //     StreamProvider(
      //       create: (context) => context.read<AuthenticationProvider>().authState,
      //       initialData: AuthenticationProvider(FirebaseAuth.instance).authState,
      //     )
      //   ],
      // child: MaterialApp(
      title: 'Firebase Authentication',
      debugShowCheckedModeBanner: false,
      home: UserManagement().handleAuth(),
    );
  }
}
