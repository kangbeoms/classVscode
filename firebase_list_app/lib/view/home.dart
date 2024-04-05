import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_list_app/model/students.dart';
import 'package:firebase_list_app/view/insert.dart';
import 'package:firebase_list_app/view/update.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore List'),
        actions: [
          IconButton(
            onPressed: () {
                Get.to(const Insert());
            },
             icon: const Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('students')
              .orderBy('code', descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final documents = snapshot.data!.docs;
            return ListView(
              children: documents.map((e) => _buildItemWidget(e)).toList(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItemWidget(doc) {
    final students = Students(
        code: doc['code'],
        name: doc['name'],
        dept: doc['dept'],
        phone: doc['phone'],
        image: doc['image']);
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete_forever),
      ),
      key: ValueKey(doc),
      onDismissed: (direction) async {
        FirebaseFirestore.instance
        .collection('students')
        .doc(doc.id)
        .delete();
        await  deleteImage(students.code);
      },
      child: GestureDetector(
        onTap: () {
          Get.to(const Update() ,arguments: [
            doc.id,
            doc['code'],
            doc['name'],
            doc['dept'],
            doc['phone'],
            doc['image']

          ]);
        },
        child: Card(
          child: ListTile(
            title: Row(
              children: [
                Image.network(
                  students.image,
                  width: 70,

                ),
                Text(
                    "학번 : ${students.code} \n\n이름 : ${students.name} \n\n학과 : ${students.dept} \n\n전화번호 : ${students.phone}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
// --Function --
deleteImage(deleteCode) async{
  //위치잡기
    final firebaseStorgae = FirebaseStorage.instance.ref().child('images').child('$deleteCode.png');
    //삭제
    await firebaseStorgae.delete();

}


}
