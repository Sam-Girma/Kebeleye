import 'package:flutter/material.dart';
import 'VerifiedAccounts.dart';
import 'package:go_router/go_router.dart';

class AccountsToBeVerified extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              key:Key("button_1"),
                onPressed: () {
                  showSearch(context: context, delegate: ATVSearchDelegate());
                },
                icon: const Icon(Icons.search))
          ],
          title: const Center(
              child: Text(
            'Admin',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(2),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    top: 50, left: 4, right: 4, bottom: 4),
                child: TextButton(
                    key:Key("button_2"),
                    style: TextButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      context.go('/accoountstobeverified');
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
                    style: TextButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      context.go('/verifiedaccount');
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
        body: _buildManager());
    // Center(
    //     child: Column(
    //   children: [
    //     Row(
    //       children: [
    //         ElevatedButton(
    //             onPressed: () {
    //               _buildManager();
    //             },
    //             child: Icon(Icons.manage_accounts)),
    //         ElevatedButton(
    //             onPressed: () {
    //               _buildUsers();
    //             },
    //             child: Icon(Icons.verified_user))
    //       ],
    //     ),
    //   ],
    // )));
  }
}

class ATVSearchDelegate extends SearchDelegate {
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
Widget _buildManager() => ListView(
      children: [
        _tile(
          'Manager Abebe',
          'Kebele manager',
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/Admin-Images/male_avatar.png'),
          ),
        ),
        _tile(
          'Manager Chala',
          'Kebele manager',
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/Admin-Images/male_avatar.png'),
          ),
        ),
        _tile(
          'Manager Chaltu',
          'Kebele manager',
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/Admin-Images/male_avatar.png'),
          ),
        ),
        _tile(
          'Manager Derebe',
          'Kebele manager',
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/Admin-Images/female_avatar.png'),
          ),
        ),
      ],
    );
