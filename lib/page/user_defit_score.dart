import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDefitScore extends StatefulWidget {
  const UserDefitScore({Key? key}) : super(key: key);

  @override
  State<UserDefitScore> createState() => _UserDefitScoreState();
}

class _UserDefitScoreState extends State<UserDefitScore> {
  final controllerName = TextEditingController();
  final controllerClasse = TextEditingController();
  final controllerDefitName = TextEditingController();
  final controllerDefitDetail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'اقتراح تحدي',
          style: TextStyle(fontFamily: 'taj', fontSize: 20),
          textDirection: TextDirection.rtl,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: controllerName,
            decoration: const InputDecoration(
                hintText: 'الرجاء ادخال الاسم',
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                prefixIcon: Icon(Icons.person)),
            maxLength: 20,
          ),
          TextField(
            controller: controllerClasse,
            decoration: const InputDecoration(
                hintText: 'الرجاء ادخال القسم',
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                prefixIcon: Icon(Icons.home)),
            maxLength: 20,
          ),
          TextField(
            controller: controllerDefitName,
            decoration: const InputDecoration(
                hintText: 'اضافة اسم التحدي',
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                prefixIcon: Icon(Icons.add_chart_outlined)),
            maxLength: 20,
          ),
          TextField(
            controller: controllerDefitDetail,
            decoration: const InputDecoration(
                hintText: 'أدخل أكثر تفاصيل حول التحدي',
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                prefixIcon: Icon(Icons.add_road_outlined)),
            maxLength: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                final user = User(
                  name: controllerName.text,
                  classe: controllerClasse.text,
                  defit_name: controllerDefitName.text,
                  defit_detail: controllerDefitDetail.text,
                  score: 0,
                );

                createUser(user);
                Navigator.pop(context);
              },
              child: const Text('اعتمد الاقتراح')),
        ],
      ),
    );
  }

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future createUser(User user) async {
    //reference to document
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user = User(
      id: docUser.id,
      name: controllerName.text,
      classe: controllerClasse.text,
      defit_name: controllerDefitName.text,
      defit_detail: controllerDefitDetail.text,
      score: 0,
    );

    user.id = docUser.id;

    final json = user.toJson();

    //create doc and write data to firebase
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final String classe;
  final String defit_name;
  final String defit_detail;
  final int score;
  User({
    this.id = '',
    required this.name,
    required this.classe,
    required this.defit_name,
    required this.defit_detail,
    required this.score,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'classe': classe,
        'defit_name': defit_name,
        'defit_detail': defit_detail,
        'score': score,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        classe: json['classe'],
        defit_name: json['defit_name'],
        defit_detail: json['defit_detail'],
        score: json['score'],
      );
}
