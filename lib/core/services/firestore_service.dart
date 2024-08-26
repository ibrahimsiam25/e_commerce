import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/data_service.dart';


class FirestoreService implements DatabaseService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data})async {
      await firestore.collection(path).add(data);
  }
   
}