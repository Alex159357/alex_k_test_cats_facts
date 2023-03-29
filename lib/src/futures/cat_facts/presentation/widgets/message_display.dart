import 'package:flutter/material.dart';

import '../../../../config/constaints/ui_constaints.dart';

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: ERROR_MESSAGE_FONT_SIZE),
        textAlign: TextAlign.center,
      ),
    );
  }
}
