import 'package:flutter/material.dart';
import 'package:store_app/pages/get_started_view.dart';
class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.person, size: 30,),
              title: Text('Tasneem Gamal Mohamed', style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('tasneemgamal044@gmail.com'),
            ),
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'About us',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                  'My name is Tasneem Gamal Mohamed Elsayed, and I am currently a student at the Faculty of Computer \n'
                  'and Information Science at Mansoura University. I have completed my third year of study and will be entering my fourth year. \n'
                  'I am a junior Flutter developer, passionate about mobile application development, and I am dedicated to expanding my skills and \n'
                  'knowledge in this area.'),
            ),
            ListTile(
              title: const Text('Your info'),
              trailing: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.privacy_tip)),
            ),
            ListTile(
              title: const Text('Log Out'),
              trailing: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, GetStartedView.id);
                },
                icon: const Icon(Icons.logout, color: Colors.red,)),
            ),
          ],
        ),
      ),
    );
  }
}