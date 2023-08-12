import 'package:flutter/material.dart';

import '../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<dynamic> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        const Icon(
          Icons.dangerous_outlined,
          color: Colors.red,
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(
          error,
        ),
        SizedBox(height: getProportionateScreenWidth(30)),
      ],
    );
  }
}
