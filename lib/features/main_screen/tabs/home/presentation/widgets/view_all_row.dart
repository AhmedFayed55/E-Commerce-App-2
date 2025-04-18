import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_styles.dart';

class ViewAllRow extends StatelessWidget {
  const ViewAllRow({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppStyles.medium18Header),
        TextButton(
          onPressed: () {},
          child: Text("View All", style: AppStyles.regular12Text),
        ),
      ],
    );
    ;
  }
}
