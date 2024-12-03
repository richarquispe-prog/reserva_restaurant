import 'package:flutter/material.dart';

class BuildUserInfo extends StatelessWidget {
  const BuildUserInfo({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Imagen del usuario
        // ClipOval(
        //   child: CachedNetworkImage(
        //     imageUrl: userImage,
        //     width: 40,
        //     height: 40,
        //     fit: BoxFit.cover,
        //     placeholder: (context, url) => const CircularProgressIndicator(),
        //     errorWidget: (context, url, error) =>
                const CircleAvatar(child: Icon(Icons.person)),
        //   ),
        // ),
        const SizedBox(width: 8),
        // Nombre del usuario
        Text(
          userName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}