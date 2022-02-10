import 'package:app/src/views/anotations_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnotationsView extends StatefulWidget {
  const AnotationsView({Key? key}) : super(key: key);

  @override
  State<AnotationsView> createState() => _AnotationsViewState();
}

class _AnotationsViewState extends State<AnotationsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ChangeNotifierProvider<AnotationsViewModel>(
          create: (_) => AnotationsViewModel(),
          child: Consumer<AnotationsViewModel>(
              builder: (_, provider, child) => FutureBuilder(
                    future: provider.getAnotations(),
                    builder: (_, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 600,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Color(0XFFE99A01),
                            ),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Edit Anotation'),
                                  content: TextFormField(
                                    initialValue: snapshot.data[index]['title'],
                                    onChanged: provider.setEditText,
                                  ),
                                  actions: [
                                    InkWell(
                                      onTap: () async {
                                        await provider.editAnotation(
                                            snapshot.data[index]['title'],
                                            provider.editText);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        alignment: Alignment.center,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0XFFE99A01),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'Edit',
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
                            child: Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Icon(Icons.delete),
                                    onTap: () async {
                                      await provider.deleteAnotation(
                                          snapshot.data[index]["title"]);
                                      setState(() {});
                                    },
                                  ),
                                  Text(snapshot.data[index]["title"]),
                                  SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  )),
        ));
  }
}
