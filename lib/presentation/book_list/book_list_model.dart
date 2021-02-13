import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/book.dart';

class BookListModel extends ChangeNotifier {
  List<Book> books = [];

  //firestoreのメソッドを呼ぶ
  //asyncを描かないとawaitは使えない
  Future fetchBooks() async {
    final docs = await Firestore.instance.collection('books').getDocuments();
    //docsがbooksに変換(マッピング)される
    final books = docs.documents.map((doc) => Book(doc['title'])).toList();
    this.books = books;
    notifyListeners();
  }
}
