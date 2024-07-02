import 'package:flutter/material.dart';
import 'package:projectakhir/domain/model/lost_item_model.dart';
import 'package:projectakhir/presentation/controller/lost_item_controller.dart';
import 'package:projectakhir/screen/form_screen.dart';
import 'package:projectakhir/screen/login_page.dart';
import 'package:projectakhir/screen/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:projectakhir/screen/userprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LostItemController _controller = LostItemController();
  List<LostItem> _lostItems = [];

  @override
  void initState() {
    super.initState();
    _loadLostItems();
  }

  Future<void> _loadLostItems() async {
    try {
      List<LostItem> items = await _controller.getLostItems('your_token_here');
      setState(() {
        _lostItems = items;
      });
    } catch (e) {
      print('Error loading lost items: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 20, // Ubah ukuran teks judul
            fontWeight: FontWeight.bold, // Tambahkan gaya teks tebal
          ),
        ),
        centerTitle: true, // Memusatkan judul
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  return Center(
                    child: Text(
                      'Hello, ${userProvider.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  );
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Lost Items'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.water_damage_outlined),
              title: Text('My Items'),
              onTap: () {
                // Handle my items tap
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24),
            ),
            Expanded(
              child: FutureBuilder<List<LostItem>>(
                future: _controller.getLostItems('your_token_here'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    List<LostItem> lostItems = snapshot.data!;
                    return ListView.builder(
                      itemCount: lostItems.length,
                      itemBuilder: (context, index) {
                        LostItem lostItem = lostItems[index];
                        return ListTile(
                          title: Text(lostItem.itemName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Description: ${lostItem.description}'),
                              Text('Category: ${lostItem.category}'),
                              Text('Location: ${lostItem.lastSeenLocation}'),
                            ],
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(lostItem.image),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
