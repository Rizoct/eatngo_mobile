// ignore_for_file: file_names
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  MainDrawer({
    Key? key,
  }) : super(key: key);

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
                urlImage: '',
                name: 'Rizky Octavian Dwipratama',
                level: 'Customer',
                onClicked: () {},
              ),
              const SizedBox(
                height: 24,
              ),
              const Divider(color: Colors.white70),
              const SizedBox(
                height: 24,
              ),
              buildMenuItem(
                  text: 'History', icon: Icons.history, navigate: () {}),
              buildMenuItem(
                  text: 'Promo & Voucher',
                  icon: Icons.discount,
                  navigate: () {}),
              buildMenuItem(
                  text: 'My Order', icon: Icons.shopping_bag, navigate: () {}),
              buildMenuItem(
                  text: 'Queue Number', icon: Icons.numbers, navigate: () {}),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: buildMenuItem(
                      text: 'Logout',
                      icon: Icons.logout,
                      navigate: () async {}),
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
                backgroundColor: Colors.green,
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
