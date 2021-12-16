// ignore_for_file: file_names

import 'package:auth/RBAC/usrmgnt.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var name = '';

class TeachersList extends StatefulWidget {
  const TeachersList({Key key}) : super(key: key);

  @override
  _TeachersListState createState() => _TeachersListState();
}

class _TeachersListState extends State<TeachersList> {
  void initState() {
    super.initState();
    // getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Teachers List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").where('userRole', isEqualTo: 'Teacher').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                QueryDocumentSnapshot<Object> doc = snapshot.data?.docs[index];
                return
                    // ListTile(
                    //   title: Text(doc.data()['name']),
                    //   subtitle: Text(doc.data()['email']),
                    // );
                    Card(
                  child: ListTile(
                    title: Text(doc['displayName']),
                    subtitle: Text(doc['cellnumber']),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
