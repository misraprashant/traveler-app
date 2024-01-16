import 'package:bmdutask/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder(
        future: userProvider.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users?[index];
                return ListTile(
                  title: Text(user.[].email),
                  subtitle: Text(user.email),
                  // Add more details or actions if needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
