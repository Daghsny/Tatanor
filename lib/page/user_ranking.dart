import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewipe/page/user.dart';
import 'package:ewipe/qrcode/scan.dart';
import 'package:flutter/material.dart';

class UserRanking extends StatefulWidget {
  const UserRanking({Key? key}) : super(key: key);

  @override
  State<UserRanking> createState() => _UserRankingState();
}

class _UserRankingState extends State<UserRanking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "ترتيب المتحديين",
          style: TextStyle(
            fontFamily: 'taj',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Mochkla ya Bro! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: const Icon(Icons.scanner),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Scan(),
            ));
          }),
    );
  }

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(
          child: Text('${user.score}'),
          backgroundColor: Colors.pink.shade300,
          foregroundColor: Colors.white,
        ),
        title: Text(user.name),
        subtitle: Text(user.classe),
      );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .orderBy('score', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}
