import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manga_reader_app/modals/book.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User? currentUser = _firebaseAuth.currentUser;
      _firebaseFirestore.collection("users").doc(currentUser!.uid).set({
        "email": email,
        "recents": [],
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateRecents(Book book) async {
    final userId = _firebaseAuth.currentUser!.uid;

    // Fetch current recents list from Firestore
    DocumentSnapshot userDoc =
        await _firebaseFirestore.collection("users").doc(userId).get();

    List<dynamic> recents = userDoc.get("recents") ?? [];

    int existingIndex = -1;
    for (int i = 0; i < recents.length; i++) {
      if (recents[i]["id"] == book.id) {
        existingIndex = i;
        break;
      }
    }

    if (existingIndex == -1) {
      recents.add(book.toJson(book));
    } else {
      recents[existingIndex] = book.toJson(book);
    }

    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      "recents": recents,
    });
  }
}
