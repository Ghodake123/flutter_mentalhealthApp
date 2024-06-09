import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ViewRecordsActivity extends StatefulWidget {
  @override
  _ViewRecordsActivityState createState() => _ViewRecordsActivityState();
}

class _ViewRecordsActivityState extends State<ViewRecordsActivity> {
  late Database _db;
  late List<Map<String, dynamic>> _records = [];

  @override
  void initState() {
    super.initState();
    _openDatabase();
  }

  Future<void> _openDatabase() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE user_table(id INTEGER PRIMARY KEY, EMAIL TEXT, PASSWORD TEXT)",
        );
      },
      version: 1,
    );

    _loadRecords();
  }

  Future<void> _loadRecords() async {
    final List<Map<String, dynamic>> records = await _db.query('user_table');
    setState(() {
      _records = records;
    });
  }

  Future<void> _deleteSelectedRecords(BuildContext context, List<int> selectedIndexes) async {
    for (final index in selectedIndexes) {
      await _db.delete(
        'user_table',
        where: 'EMAIL = ?',
        whereArgs: [_records[index]['EMAIL']],
      );
    }
    _loadRecords();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected records deleted successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Records'),
      ),
      body: ListView.builder(
        itemCount: _records.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(
                'Email: ${_records[index]['EMAIL']}, Password: ${_records[index]['PASSWORD']}'),
            value: false,
            onChanged: (bool? value) {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final List<int> selectedIndexes = [];
          for (var i = 0; i < _records.length; i++) {
            // Add the index of selected items to the list
            if (_records[i]['selected']) {
              selectedIndexes.add(i);
            }
          }
          _deleteSelectedRecords(context, selectedIndexes); // Pass context here
        },
        child: Icon(Icons.delete),
      ),
    );
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }
}
