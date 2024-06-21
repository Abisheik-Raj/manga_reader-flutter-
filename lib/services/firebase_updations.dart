import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manga_reader_app/modals/recent_book_modal.dart';
import 'package:provider/provider.dart';

class FirebaseUpdations {
  static listenToRecentBooks(BuildContext context) {
    RecentBookModal recentBookModalProvider =
        Provider.of<RecentBookModal>(context, listen: false);

    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        List<dynamic> recents = snapshot.get("recents");
        if (recents.isNotEmpty) {
          recentBookModalProvider.updateRecents(recents);
          Map<dynamic, dynamic> recentBook = recents[recents.length - 1];
          recentBookModalProvider.updateRecentBook(
            recentBook["id"],
            recentBook["title"],
            recentBook["description"],
            recentBook["imageUrl"],
            recentBook["currentChapter"],
            recentBook["totalChapters"],
            true,
          );
        } else {
          recentBookModalProvider.updateRecentBook(
            "",
            "",
            "",
            "",
            0,
            0,
            false,
          );
          recentBookModalProvider.updateRecents([]);
        }
      }
    });
  }
}
