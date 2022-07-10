import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoneyPage extends StatelessWidget {
  const MoneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text(
          "الحصالة الإلكترونية",
          style: TextStyle(
            fontFamily: 'taj',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('piggy_bank').snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.hasError) {
              return const Text("erroe!!");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              );
            }
            //var items = snapshot.data?.docs ?? [];

            //final data = snapshot.requireData;

            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Center(
                    child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image(
                        // height: MediaQuery.of(context).size.height * 0.9,
                        image: NetworkImage(document['img_url'])),
                  ],
                ));
              }).toList(),
            );
          }),
    );
  }
}
