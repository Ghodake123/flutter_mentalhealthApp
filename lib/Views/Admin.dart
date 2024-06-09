import 'package:flutter/material.dart';
import 'package:flutter_sqlite_auth_app/JSON/users.dart'; // Import the User model
import 'package:flutter_sqlite_auth_app/SQLite/database_helper.dart'; // Import the DatabaseHelper

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late List<User> _users;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      List<User> users = await DatabaseHelper.instance.getUsers();
      setState(() {
        _users = users;
        _loading = false;
      });
    } catch (e) {
      print('Error fetching users: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Records'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_users[index].username),
            subtitle: Text(_users[index].email),
          );
        },
      ),
    );
  }
}
