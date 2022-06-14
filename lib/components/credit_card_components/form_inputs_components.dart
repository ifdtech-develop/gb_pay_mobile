import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../util/colors.dart';

class FormInputs extends StatelessWidget {
  final TextEditingController numeroCartaoController;
  final String title;
  final IconData icon;
  final String validator;

  const FormInputs({
    Key? key,
    required this.numeroCartaoController,
    required this.title,
    required this.icon,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25.0,
          ),
        ),
        TextFormField(
          controller: numeroCartaoController,
          validator:
              RequiredValidator(errorText: 'Por favor, insira o $validator'),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: ColorsProject.blueWhite,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsProject.strongGrey,
              ),
            ),
            // Border quando usuario clica no input
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}