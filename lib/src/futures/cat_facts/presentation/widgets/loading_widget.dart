import 'package:flutter/material.dart';

import '../../../../config/constaints/ui_constaints.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: DEFAULT_LOADING_INDICATOR_SIZE,
        height: DEFAULT_LOADING_INDICATOR_SIZE,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
