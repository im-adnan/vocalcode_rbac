// import 'authentication_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


// class HomePage extends StatelessWidget {
//   const HomePage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("WELCOME HOME",style:TextStyle(fontSize: 30)),
            
            
//             RaisedButton(
//               onPressed: () {
//                 context.read<AuthenticationProvider>().signOut();
//               },
//               child: const Text("Sign out"),
//             ),
            
//           ],
//         ),
//       ),
//     );
//   }
// }