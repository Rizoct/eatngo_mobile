// ignore_for_file: file_names, prefer_const_constructors
import 'package:eatngo_thesis/screens_restaurant/drawersmenu_restaurant/drawer_profile_restaurant.dart';
import 'package:eatngo_thesis/screens_restaurant/drawersmenu_restaurant/drawer_promo_restaurant.dart';
import 'package:eatngo_thesis/screens_restaurant/drawersmenu_restaurant/drawer_viewrating.dart';
import 'package:flutter/material.dart';

class RestaurantDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  RestaurantDrawer({
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
                urlImage:
                    'https://i0.wp.com/kliklegal.com/wp-content/uploads/2022/08/Mie-Gacoan-Tak-Bisa-Kantongi-Label-Halal-Benarkah.jpg',
                name: 'Mie Gacoan',
                level: 'Restaurant',
                onClicked: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DrawerProfileRestaurantPage()));
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
                  text: 'View Rating',
                  icon: Icons.star,
                  navigate: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DrawerViewRatingPage()));
                  }),
              buildMenuItem(
                  text: 'Add Promo',
                  icon: Icons.discount,
                  navigate: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DrawerViewPromoPage()));
                  }),
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
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(urlImage)),
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
