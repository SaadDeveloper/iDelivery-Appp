import 'package:flutter/material.dart';
import 'package:idelivery_app/src/utils/constants.dart';

Widget pseudoAppBar() => Padding(
      padding: const EdgeInsets.all(7.5),
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Glory!',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                Text(
                  'How may we help you today?',
                  style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w400),
                )
              ],
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(profilePictureLink),
            )
          ],
        ),
      ),
    );

class LocationButton extends StatelessWidget {
  final String text;
  final bool isIconRequired;
  const LocationButton({
    super.key,
    required this.text,
    required this.isIconRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isIconRequired
          ? Container(
              padding: EdgeInsets.all(10),
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(text), Icon(Icons.location_pin)],
              ),
            )
          : Container(
              padding: EdgeInsets.all(10),
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Text(text),
                ],
              ),
            ),
    );
  }
}

class DeliveryMode extends StatelessWidget {
  final Color color;
  const DeliveryMode({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  final String imageUrl;
  const ImageTile({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 185,
        width: 250,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
