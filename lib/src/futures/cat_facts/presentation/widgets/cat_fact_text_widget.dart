

import 'package:flutter/material.dart';

import '../../../../config/constaints/ui_constaints.dart';

class CatFactTextWidget extends StatelessWidget {
  final String text;
  final String createdAt;
  const CatFactTextWidget({Key? key, required this.text, required this.createdAt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TEXT_WIDGET_BORDER_RADIUS),
          color: Colors.black12
      ),
      padding: const EdgeInsets.symmetric(horizontal: PADDING_X6, vertical: PADDING_X8),
      margin: const EdgeInsets.symmetric(horizontal: PADDING_X16, vertical: DEFAULT_PADDING),
      child: Column(
        children: [
          Center(child: Text(text, style: Theme.of(context).textTheme.bodyMedium,),),
          Padding(
            padding: const EdgeInsets.only(top: DEFAULT_PADDING),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(createdAt, style: Theme.of(context).textTheme.bodySmall,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
