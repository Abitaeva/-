import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // или другой индикатор загрузки
        } else {
          final SharedPreferences prefs = snapshot.data!;
          final String name = prefs.getString('name') ?? 'Temirlan';
          final String email = prefs.getString('email') ?? 'timka@gmail.com';
          final String phoneNumber = prefs.getString('phoneNumber') ?? '87777777777';

          return Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Phone Number:',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    phoneNumber,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
