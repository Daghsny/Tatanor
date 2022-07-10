import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.pink,
            centerTitle: true,
            title: const Text(
              'فريق العمل',
              style: TextStyle(fontFamily: 'taj'),
            )),
        body: Center(
          child: ListView(children: const [
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text('Sami Akkar'),
              subtitle: Text('Animator'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Rim Chemlali'),
              subtitle: Text('Designer'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text('Jawhar laabar'),
              subtitle: Text('Devlopper'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Ikram Abdel Nour'),
              subtitle: Text('Editor in book Lab'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Sana Aboulwafa'),
              subtitle: Text('Technical Team'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Imen Ben Aoun'),
              subtitle: Text('Content Editor'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Assila Moaddeb'),
              subtitle: Text('Content Creator'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Tassnim Ghorghar'),
              subtitle: Text('Graphic Designer'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Rawan Jarray'),
              subtitle: Text('Sensitization Team'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Arij AbdelKbir'),
              subtitle: Text('Technical Team'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Dhoha Abdel Ouiniss'),
              subtitle: Text('Editor Book Lab '),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Islem Ezzeddine'),
              subtitle: Text('Game Team'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Khaoula Doudey'),
              subtitle: Text('Writer'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Issraa Tayeb'),
              subtitle: Text('Team Leader'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
              title: Text('Abir Amara'),
              subtitle: Text('Writer'),
              trailing: Icon(
                Icons.star_border_outlined,
                color: Colors.grey,
              ),
            ),
          ]),
        ));
  }
}
