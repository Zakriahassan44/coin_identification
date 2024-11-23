import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final VoidCallback onPressed;

  const CustomListtile({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 0.5,
                offset: Offset.fromDirection(2, 4)),
          ],
        ),
        child: ListTile(
          tileColor: Colors.white,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.network(image),
          ),
          title: Text(
            title,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          subtitle: Text(
            description,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          style: ListTileStyle.drawer,
          iconColor: Colors.black,
          onTap: onPressed,
        ),
      ),
    );
  }
}
