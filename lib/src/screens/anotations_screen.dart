import 'package:app/src/views/anotations_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnotationsScreen extends StatefulWidget {
  const AnotationsScreen({Key? key}) : super(key: key);

  @override
  _AnotationsScreenState createState() => _AnotationsScreenState();
}

class _AnotationsScreenState extends State<AnotationsScreen> {
  String titleAnotation = '';

  Future<void> addAnotation() async {
    FirebaseFirestore.instance.collection('anotations').add({
      "title": titleAnotation,
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add anotation'),
              content: TextField(
                onChanged: (value) => titleAnotation = value,
                decoration: InputDecoration(
                  hintText: 'Anotation name',
                ),
              ),
              actions: [
                InkWell(
                  onTap: () async {
                    await addAnotation();
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0XFFE99A01),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Add Anotation',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(Icons.arrow_back)),
                      ),
                      Text(
                        'Anotations',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(),
                    ]),
              ),
              AnotationsView(),
            ],
          ),
        ),
      ),
    );
  }
}
