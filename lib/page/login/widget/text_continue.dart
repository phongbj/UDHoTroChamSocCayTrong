import 'package:flutter/material.dart';

import '../../../constants/app_styles.dart';

class TextContinue extends StatelessWidget {
  const TextContinue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 20,
          ),
        ),
        Text(
          ('or_continue_with'),
          style: AppStyles.p,
        ),
        const Expanded(
          child: Divider(
            color: Colors.black,
            endIndent: 20,
            indent: 10,
          ),
        ),
      ],
    );
  }
}
