import 'package:flutter/material.dart';

class ArtError extends StatelessWidget {
  final String title;

  const ArtError({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4.0),
            child: const Icon(
              Icons.error,
              size: 18.0,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Text(title),
          )
        ],
      ),
    );
  }
}
