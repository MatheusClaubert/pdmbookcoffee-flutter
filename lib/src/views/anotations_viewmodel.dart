import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnotationsViewModel with ChangeNotifier {
  String _editText = '';

  String get editText => _editText;

  setEditText(String editText) {
    _editText = editText;
  }

  Future getAnotations() async {
    var anotations =
        await FirebaseFirestore.instance.collection('anotations').get();

    print("DOCUMENTS ${anotations.docs}");

    return anotations.docs;
  }

  Future<void> editAnotation(String title, String newTitle) async {
    if (newTitle != '') {
      await FirebaseFirestore.instance
          .collection('anotations')
          .where("title", isEqualTo: title)
          .get()
          .then(
            (value) => value.docs.forEach(
              (element) {
                FirebaseFirestore.instance
                    .collection('anotations')
                    .doc(element.id)
                    .update({"title": newTitle});
              },
            ),
          );
      notifyListeners();
    } else {
      return null;
    }
  }

  Future<void> deleteAnotation(String title) async {
    await FirebaseFirestore.instance
        .collection('anotations')
        .where("title", isEqualTo: title)
        .get()
        .then(
          (value) => value.docs.forEach(
            (element) {
              FirebaseFirestore.instance
                  .collection('anotations')
                  .doc(element.id)
                  .delete();
            },
          ),
        );
  }
}
