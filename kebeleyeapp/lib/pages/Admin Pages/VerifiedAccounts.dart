import 'package:flutter/material.dart';
// import './main.dart';
import 'AccountsTobeVerified.dart';

class VerifiedAccounts extends StatefulWidget {
  const VerifiedAccounts({Key? key}) : super(key: key);

  @override
  State<VerifiedAccounts> createState() => _VerifiedAccountsState();
}

class _VerifiedAccountsState extends State<VerifiedAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: Icon(Icons.search)),
        ],
        title: const Center(
          child: Text('Admin'),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(2),
          children: <Widget>[
            Container(
              margin:
                  const EdgeInsets.only(top: 50, left: 4, right: 4, bottom: 4),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AccountsToBeVerified()));
                  },
                  child: const Text(
                    'Accounts to be verified',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              color: Colors.green,
            ),
            Container(
              margin: const EdgeInsets.all(4),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifiedAccounts()));
                  },
                  child: const Text(
                    'Verified accounts',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              color: Colors.green,
            ),
          ],
        ),
      ),
      body: _buildUsers(),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Abebe',
    'Chala',
    'Derebe',
    'Chaltu',
    'Bekele',
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), // closes searchbar
      icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null); //close searchbar
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear),
        )
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
          child: Text(
        query,
        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
      ));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        });
  }
}

ListTile _tile(String title, String subtitle, Widget image) => ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text(subtitle),
      leading: image,
    );
Widget _buildUsers() => ListView(
      children: [
        _tile(
          'User Abebe',
          'Pilot',
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/Admin-Images/male_avatar.png'),
          ),
        ),
        _tile(
          'User Chala',
          'Highschool Teacher',
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/Admin-Images/male_avatar.png'),
          ),
        ),
        _tile(
          'User Chaltu',
          'Highschool Teacher',
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/Admin-Images/male_avatar.png'),
          ),
        ),
        _tile(
          'User Derebe',
          'Doctor',
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/Admin-Images/female_avatar.png'),
          ),
        ),
      ],
    );
