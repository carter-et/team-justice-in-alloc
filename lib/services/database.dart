import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // final String testingID; //in the future we are going to pass in this var in the Database Services instance
  // DatabaseService ({ this.testingID });

  // collection reference
  final CollectionReference testingCollection = Firestore.instance.collection('testing');

  Future updateCount() async {
    return await testingCollection.document("target").updateData({"count" : FieldValue.increment(1)});
  }
}