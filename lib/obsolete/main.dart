// import 'package:firebase_auth/firebase_auth.dart';
// import 'authentication_provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'usrmgnt.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider<AuthenticationProvider>(
//           create: (_) => AuthenticationProvider(FirebaseAuth.instance),
//         ),
//         StreamProvider(
//           create: (context) => context.read<AuthenticationProvider>().authState,
//           initialData: AuthenticationProvider(FirebaseAuth.instance).authState,
//         )
//       ],
//       child: MaterialApp(
//         title: 'Firebase Authentication',
//         home: UserManagement().handleAuth(),
//       ),
//     );
//   }
// }

// // class Authenticate extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final firebaseUser = context.watch<User>();

// //     if (firebaseUser != null) {
// //       return HomePage();
// //     }
// //     return LogInPage();
// //   }
// // }