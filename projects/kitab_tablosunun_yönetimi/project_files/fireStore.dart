import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreServices {
  // get collection of books from the database

  final CollectionReference books =
      FirebaseFirestore.instance.collection("books");

  // CREATE : add a new book to the collection
  Future<void> addBook(String kitapAdi, String yayinEvi, String yazar,
      String sayfaSayisi, String basimYili, String kategori, bool checkbox) {
    return books.add({
      "kitab adi": kitapAdi,
      "yayinEvi": yayinEvi,
      "yazarlar": yazar,
      "sayfa sayisi": sayfaSayisi,
      "basim yili": basimYili,
      "timestamp": Timestamp.now(),
      "kategori": kategori,
      "checkbox": checkbox
    });
  }

  // get books from the database
  Stream<QuerySnapshot> getBooksStream() {
    final booksStream =
        books.orderBy("timestamp", descending: false).snapshots();
    return booksStream;
  }

  // update books from the database
  Future<void> updateBook(
      String? docID,
      String newBook,
      String newyayinEvi,
      String newyazarlar,
      String newSayfaSayisi,
      String newBasimYili,
      String categori,
      bool? checkbox) {
    return books.doc(docID).update({
      "kitab adi": newBook,
      "yayinEvi": newyayinEvi,
      "yazarlar": newyazarlar,
      "sayfa sayisi": newSayfaSayisi,
      "basim yili": newBasimYili,
      "kategori": categori,
      "checkbox": checkbox,
      "timestamp": Timestamp.now()
    });
  }

  // delete books from the database
  Future<void> deleteBook(String docID) {
    return books.doc(docID).delete();
  }
}
