import 'package:flutter/material.dart';
import 'package:flutter_rest_api_example/model/user.dart';
import 'package:flutter_rest_api_example/services/user_api.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState(){

    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Rest API call")),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          /*final name = user.name;
          final email = user.email;
          final gender = user.gender;
          final phone = user.phone;
          final nat = user.nat;
          final cell = user.cell;*/
          // final cell = user.image;

          /*final color = user.gender == 'male' ? Colors.blue : Colors.green;*/
          // final imageUrl = user['picture']['thumbnail'];
          return ListTile(
            /*leading: CircleAvatar(
               // child: Text('$index'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                  child: Image.network(imageUrl),
              ),
            ),*/
            title: Text(user.fullName),
            subtitle: Text(user.email),
            // tileColor: color,
          );
        },
      ),
     /* floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: const Icon(Icons.refresh),
      ),*/
    );
  }


  Future <void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    users = response;
  }
}
