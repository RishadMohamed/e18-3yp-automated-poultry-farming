import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

//database functions for farms registration
Future<bool> addFarmer(String name, String location) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('Farms')
            .doc();
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Location': location, 'Name': name});
        return true;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateFarm(String id, String location) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('Farms')
            .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);

      try {
        //double newAmount = value;
        transaction.update(documentReference, {'Location': location});
        return true;
      } catch (e) {
        rethrow;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> removeFarm(String id) async {
  try {
    if (FirebaseAuth.instance.currentUser != null) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance
          .collection('Farmers')
          .doc(uid)
          .collection('Farms')
          .doc(id)
          .delete();
      return true;
    } else {
      throw ("This is my first general exception");
    }
  } catch (e) {
    rethrow;
  }
}

//database functions for farm branch registration
Future<bool> addBranch(String branchName, String farmID) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('Branch')
            .doc();
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'FarmID': farmID, 'BranchName': branchName});
        //documentReference.set({'BranchName': branchName});
        return true;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateBranch(String id, String branchName) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('Branch')
            .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);

      try {
        //double newAmount = value;
        //transaction.update(documentReference, {'FarmName': farmName});
        transaction.update(documentReference, {'BranchName': branchName});
        return true;
      } catch (e) {
        rethrow;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<String> getFarm(String selectedFarm) async {
  //String farmName;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  final doc = await FirebaseFirestore.instance
      .collection('Farmers')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('farm')
      .doc(selectedFarm)
      .get();

  return doc['Name'];
  //eturn farmName;
}

Future<bool> removeBranch(String id) async {
  try {
    if (FirebaseAuth.instance.currentUser != null) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance
          .collection('Farmers')
          .doc(uid)
          .collection('Branch')
          .doc(id)
          .delete();
      return true;
    } else {
      throw ("This is my first general exception");
    }
  } catch (e) {
    rethrow;
  }
}

//database functions for sheds
Future<bool> addShed(String shedName, String branchID, String farmID) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('Shed')
            .doc();
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set(
            {'BranchID': branchID, 'ShedName': shedName, 'FarmID': farmID});
        return true;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateShed(String id, String shedName) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('Shed')
            .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);

      try {
        //double newAmount = value;
        transaction.update(documentReference, {'ShedName': shedName});
        return true;
      } catch (e) {
        rethrow;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> removeShed(String id) async {
  try {
    if (FirebaseAuth.instance.currentUser != null) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance
          .collection('Farmers')
          .doc(uid)
          .collection('Shed')
          .doc(id)
          .delete();
      return true;
    } else {
      throw ("This is my first general exception");
    }
  } catch (e) {
    rethrow;
  }
}

// ignore: deprecated_member_use
//final databaseRef = FirebaseDatabase.instance.reference();
//database functions for sheds
Future<bool> addFlock(
    DatabaseReference databaseRef,
    String flockName,
    String shedID,
    String branchID,
    String farmID,
    String sDay,
    //String type,
    String strain,
    String numberChicken,
    String bDay) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    // String flockID;
    // FirebaseFirestore.instance
    //     .collection('Farmers')
    //     .doc(uid)
    //     .collection('flock')
    //     .doc()
    //     .get()
    //     .then((DocumentSnapshot snapshot) => flockID = snapshot.id);

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('flock')
            .doc()
        /*.collection('startdays')
            .doc(sDay)
            .collection('types')
            .doc(type)
            .collection('strains')
            .doc(strain)
            .collection('counts')
            .doc(numberChicken)*/
        ;

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({
          'ShedID': shedID,
          'BranchID': branchID,
          'FarmID': farmID,
          'startdays': sDay,
          //'type': type,
          'strain': strain,
          'count': numberChicken,
          'FlockName': flockName,
          'birthDate': bDay,
          'Active': "yes",
          'Mortal': 0,
          'Egg': 0,
          'Avg_BodyWeight': 0.0,
          //adding data
          'Evening Feed Amount': 0.0,
          'Evening Feed Time': "00:00:00",
          'Night Feed Amount': 0.0,
          'Night Feed Time': "00:00:00",
          'Morning Feed Amount': 0.0,
          'Morning Feed Time': "00:00:00",
          'Feed Tank Alert': 0,
          'Feed Tank Capacity': 0,
          'Water Tank Alert': 0,
          'Water Tank Capacity': 0,
          'Current Water Level': 0.0,
          'Current Feed Level': 0.0,
          //'flockID': snapshot.id,
        });
        insertData(databaseRef, snapshot.id, uid);
        return true;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

void insertData(DatabaseReference databaseRef, String id, String uid) {
  databaseRef.child(uid).child(id).set({
    //'id': keyID,
    'Last Modified Date': "0000-00-00",
    'Feed Tank Alert': 100,
    'Feed Tank Capacity': 0,
    'Water Tank Alert': 0,
    'Water Tank Capacity': 0,
    'Morning Time': 00,
    'Morning Feed Time MM': 00,
    'Evening Time': 00,
    'Evening Feed Time MM': 00,
    'Night Time': 00,
    'Night Feed Time MM': 00,
    'Morning Feed Amount': 0.0,
    'Evening Feed Amount': 0.0,
    'Night Feed Amount': 0.0,
    'Current Water Level': 0.0,
    'Current Feed Level': 0.0,
  });
}

Future<bool> updateFlockName(
  String id,
  String flockName,
) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('flock')
            .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);

      try {
        //double newAmount = value;
        transaction.update(documentReference, {'FlockName': flockName});
        return true;
      } catch (e) {
        rethrow;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updatesDay(String id, String sDay) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('flock')
            .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);

      try {
        //double newAmount = value;
        transaction.update(documentReference, {'startdays': sDay});
        return true;
      } catch (e) {
        rethrow;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateType(String id, String type) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('flock')
            .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);

      try {
        //double newAmount = value;
        transaction.update(documentReference, {'type': type});
        return true;
      } catch (e) {
        rethrow;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateStrain(String id, String strain) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('flock')
            .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);

      try {
        //double newAmount = value;
        transaction.update(documentReference, {'strain': strain});
        return true;
      } catch (e) {
        rethrow;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateCount(String id, String count) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('flock')
            .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);

      try {
        //double newAmount = value;
        transaction.update(documentReference, {'count': count});
        return true;
      } catch (e) {
        rethrow;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updatebDay(String id, String bDay) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(uid)
            .collection('flock')
            .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);

      try {
        //double newAmount = value;
        transaction.update(documentReference, {'birthDate': bDay});
        return true;
      } catch (e) {
        rethrow;
      }
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> removeFlock(String id) async {
  try {
    if (FirebaseAuth.instance.currentUser != null) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance
          .collection('Farmers')
          .doc(uid)
          .collection('flock')
          .doc(id)
          .delete();
      return true;
    } else {
      throw ("This is my first general exception");
    }
  } catch (e) {
    rethrow;
  }
}

Future<void> addEggs(String id, String amount, String date) async {
  num current = 0;
  num value = int.parse(amount);
  try {
    print("try 1");
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('flock')
            .doc(id)
            .collection('NumberofEggs')
            .doc(date);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await transaction.get(documentReference);
      if (!snapshot.exists) {
        print("done 1 before");
        documentReference.set({'Amount': value});
        print("done 1");
      } else {
        try {
          //num newAmount = snapshot.data()!['Amount'] + value;
          current = snapshot.data()!['Amount'];
          transaction.update(documentReference, {'Amount': value});
          print("done 1.2");
          print(current);
          //return true;
        } catch (e) {
          //rethrow;
        }
      }
    });
  } catch (e) {
    // return false;
  }
  try {
    print("try 2");
    DocumentReference<Map<String, dynamic>> documentReference2 =
        FirebaseFirestore.instance
            .collection('Farmers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('flock')
            .doc(id);

    FirebaseFirestore.instance.runTransaction((transaction2) async {
      DocumentSnapshot<Map<String, dynamic>> snapshot2 =
          await transaction2.get(documentReference2);
      print(documentReference2);
      if (!snapshot2.exists) {
        print("snap 2 noy exist");
        documentReference2.update({'Egg': value});
        print("done 2");
        print(value);
        //return true;
      } else {
        try {
          print("done 2.2 before");
          num n = snapshot2.data()!['Egg'];
          num newAmount = n - current + value;
          print("done 2.2 before 2");
          transaction2.update(documentReference2, {'Egg': newAmount});
          print("done 2.2");
          //return true;
        } catch (e) {
          //rethrow;
        }
      }
    });
  } catch (e) {
    //
  }
}
