import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomNumberInput extends StatelessWidget {
  final String fieldName;
  const CustomNumberInput({super.key, required this.fieldName});

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(8),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        FormBuilderTextField(
          name: fieldName,
          decoration: InputDecoration(
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            filled: true,
          ),
          keyboardType: TextInputType.number,
          validator: FormBuilderValidators.integer(),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
