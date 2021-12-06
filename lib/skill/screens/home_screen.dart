import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill/screens/login_screen.dart';
import 'package:skill/screens/web_screen.dart';
import 'package:device_info/device_info.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
          )
        ],
      ),
      body: ListView(
        // child: Text(uid),
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FutureBuilder(
            future: deviceInfo.androidInfo,
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                AndroidDeviceInfo info = snapshot.data;
                return Container(
                  child: Column(
                    children: [
                      Text("${info.brand}"),
                      Text("${info.device}"),
                      Text("${info.model}"),
                      Text("${info.manufacturer}"),
                      Text("${info.id}"),
                      Text("${info.version.baseOS}"),
                      Text("${info.version.codename}"),
                      Text("${info.version.sdkInt}"),
                      Text("${info.fingerprint}"),
                      Text("${info.type}"),
                    ],
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WebViewContainer(
                        'https://vocalcode.co.in', 'VocalCode');
                  },
                ),
              );
            },
            child: Text('Vist Website'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
  }
}
