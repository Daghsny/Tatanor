import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  // final Stream<QuerySnapshot> gallery =
  //     FirebaseFirestore.instance.collection('gallery').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text(
          "مسلسل تاتانو",
          style: TextStyle(
            fontFamily: 'taj',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('gallery').snapshots(),
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
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image(
                          width: MediaQuery.of(context).size.width / 1.5,
                          image: NetworkImage(document['img_url'])),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        document['title'],
                        style:
                            const TextStyle(fontFamily: 'taj', fontSize: 18.0),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ));
              }).toList(),
            );
          }),
    );
  }
}
