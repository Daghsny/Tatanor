import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text(
          "حول التطبيق",
          style: TextStyle(fontFamily: 'taj', fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo_apps.png",
              width: 120,
            ),
            const Text(
              '\n'
              " هو أحد مشاريع"
              //
              "  نادي كيدبرونار إبن رشد تطاوين "
              '\n'
              'KIDPreneur IbnRochd'
              '\n'
              'يستهدف الأطفال والمربين'
              '\n'
              '\n'
              " نقوم من خلاله بتقديم حلول ذكية, إيكولوجية و مستدامة للمشاكل المتعلقة بالمحيط المدرسي. "
              '\n'
              '\n'
              "تاتانور حلم يُتيح الفرصة للتلميذ بأن يتعاطف ويتفاعل مع قضايا العالم من حوله "
              "من خلال خوض تجارب تُدربه على العمل في المساحات المُتاحة وعلى مهارات حل للمشاكل ومهارات الإبتكار و الإبداع.",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Image.asset(
              'assets/images/logoir.png',
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
