// ignore_for_file: file_names, prefer_const_constructors
import 'package:eatngo_thesis/functions/connection.dart';
import 'package:eatngo_thesis/screens_customer/drawersmenu_customer/drawer_history.dart';
import 'package:eatngo_thesis/screens_customer/drawersmenu_customer/drawer_myorder.dart';
import 'package:eatngo_thesis/screens_customer/drawersmenu_customer/drawer_profile.dart';
import 'package:eatngo_thesis/screens_customer/drawersmenu_customer/drawer_promo.dart';
import 'package:eatngo_thesis/screens_customer/drawersmenu_customer/drawer_queue.dart';
import 'package:eatngo_thesis/screens_loginregister/login_customer.dart';
import 'package:eatngo_thesis/screens_loginregister/login_main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final Map data;
  MainDrawer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.indigo.shade700,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              buildHeader(
                urlImage: '$ip/img/customer/default-ava.jpg',
                name: data["name"],
                level: data["role"],
                onClicked: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DrawerProfilePage(
                                data: data,
                              )));
                },
              ),
              const SizedBox(
                height: 24,
              ),
              const Divider(color: Colors.white70),
              const SizedBox(
                height: 24,
              ),
              buildMenuItem(
                  text: 'History',
                  icon: Icons.history,
                  navigate: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DrawerHistoryPage(
                                  userData: data,
                                )));
                  }),
              buildMenuItem(
                  text: 'Promo & Voucher',
                  icon: Icons.discount,
                  navigate: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DrawerPromoPage()));
                  }),
              buildMenuItem(
                  text: 'My Order',
                  icon: Icons.shopping_bag,
                  navigate: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DrawerMyOrderPage(
                                  userData: data,
                                )));
                  }),
              buildMenuItem(
                  text: 'Queue Number',
                  icon: Icons.numbers,
                  navigate: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => DrawerQueuePage(
                                  userData: data,
                                )));
                  }),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: buildMenuItem(
                      text: 'Logout',
                      icon: Icons.logout,
                      navigate: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Logout'),
                            content: const Text(
                                'Apakah anda ingin Logout dari aplikasi?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.remove('username');
                                  await prefs.remove('password');
                                  print('tes');
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginMainPage()));
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required VoidCallback navigate,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: navigate,
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String level,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/images/default-ava.jpg'),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      level,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
