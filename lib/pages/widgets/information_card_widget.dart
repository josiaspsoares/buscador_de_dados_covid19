import 'package:flutter/material.dart';

class InformationCardWidget extends StatelessWidget {
  const InformationCardWidget({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.data,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ListTile(
              leading: Icon(
                icon,
                color: Colors.white,
              ),
              title: Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                data,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
