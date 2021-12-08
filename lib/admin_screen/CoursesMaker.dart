// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseMaker extends StatefulWidget {
  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CourseMaker> {
  List Courses = List.empty();
  String title = "";
  String description = "";

  @override
  // void initState() {
  //   super.initState();
  //   Courses = ["Hello", "Hey There"];
  // }

  createCourses() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Courses").doc(title);

    Map<String, String> CourseMaker = {
      "CoursesTitle": title,
      "CoursesDesc": description
    };

    documentReference
        .set(CourseMaker)
        .whenComplete(() => print("Data stored successfully"));
  }

  deleteCourses(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Courses").doc(item);

    documentReference
        .delete()
        .whenComplete(() => print("deleted successfully"));
  }

  updateCourses(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Courses").doc(item);

    Map<String, String> CourseMaker = {
      "CoursesTitle": title,
      "CoursesDesc": description
    };

    documentReference
        .update(CourseMaker)
        .whenComplete(() => print("Data updated successfully"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Firebase Courses'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Courses").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.builder(
              shrinkWrap: false,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                QueryDocumentSnapshot<Object> documentSnapshot =
                    snapshot.data?.docs[index];
                return Dismissible(
                  key: Key(index.toString()),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text((documentSnapshot != null)
                          ? (documentSnapshot["Title"])
                          : ""),
                      subtitle: Text((documentSnapshot != null)
                          ? ((documentSnapshot["Desciption"] != null)
                              ? documentSnapshot["Description"]
                              : "")
                          : ""),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          setState(
                            () {
                              //Coursess.removeAt(index);
                              deleteCourses((documentSnapshot != null)
                                  ? (documentSnapshot["Title"])
                                  : "");
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
                // valueColor: AlwaysStoppedAnimation<Color>(
                // Colors.red,
                // ),
                ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: const Text("Add Course"),
                  content: Container(
                    width: 400,
                    height: 100,
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (String value) {
                            title = value;
                          },
                        ),
                        TextField(
                          onChanged: (String value) {
                            description = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          setState(() {
                            //Coursess.add(title);
                            createCourses();
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          // color: Colors.black,
        ),
      ),
    );
  }
}
