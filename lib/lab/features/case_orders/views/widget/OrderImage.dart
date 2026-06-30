


import 'package:flutter/material.dart';

class OrderImage extends StatelessWidget {
  final String imagePath;


  const OrderImage({
    required this.imagePath,
  
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: imagePath.isEmpty
              ? Image.asset(
                  'assets/images/toothdefult.png',
                  width: 120,
                  height: 125,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  _fullImageUrl(imagePath),
                 width: 120,
                  height: 125,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Image.asset(
                      'assets/images/toothdefult.png',
                      width: 130,
                      height: 145,
                      fit: BoxFit.cover,
                    );
                  },
                ),
        ),

      

    

      ],
    );
  }

  String _fullImageUrl(String path) {
    if (path.startsWith('http')) return path;
    return 'http://192.168.1.10:44352/$path';
  }
}

  