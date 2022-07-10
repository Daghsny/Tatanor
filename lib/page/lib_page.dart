import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LibPage extends StatefulWidget {
  const LibPage({Key? key}) : super(key: key);

  @override
  State<LibPage> createState() => _LibPageState();
}

class _LibPageState extends State<LibPage> {
  final Stream<QuerySnapshot> corses =
      FirebaseFirestore.instance.collection('corses').snapshots();
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }),
        title: const Text("ملخصات دروس",
            style: TextStyle(
              fontFamily: 'taj',
              fontSize: 25,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: corses,
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

          final data = snapshot.requireData;

          return Stack(
            children: [
              PageView.builder(
                controller: pageController,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Container(
                      color: Colors.pink,
                      height: 100,
                      width: double.infinity,
                      child: Text(
                        data.docs[index]['name'],
                        style: const TextStyle(color: Colors.white),
                        textDirection: TextDirection.rtl,
                      ),
                      alignment: Alignment.center,
                    ),
                    Image(
                        width: double.infinity,
                        //MediaQuery.of(context).size.width / 2,
                        image: NetworkImage(data.docs[index]['imgurl'])),
                  ]);
                },
              ),
              Positioned(
                right: 12,
                top: MediaQuery.of(context).size.height / 3.5,
                child: SmoothPageIndicator(
                  effect: WormEffect(activeDotColor: Colors.pink.shade300),
                  axisDirection: Axis.vertical,
                  controller: pageController,
                  count: data.size,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
