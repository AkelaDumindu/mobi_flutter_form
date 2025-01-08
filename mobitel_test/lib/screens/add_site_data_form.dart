import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobitel_test/screens/next_screen.dart';
import 'package:mobitel_test/widget/custom_button.dart';
import 'package:mobitel_test/widget/custom_input.dart';
import 'package:mobitel_test/widget/custom_number_input.dart';

class AddSiteDataForm extends StatelessWidget {
  const AddSiteDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    void buttonNext() {
      if (formKey.currentState?.saveAndValidate() ?? false) {
        final formData = formKey.currentState!.value;
        print('Form Data on current page: $formData');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NextScreen(
              formData: formData,
            ),
          ),
        );
      } else {
        print('Form validation failed.');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: const Text('Add Site Data')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(fieldName: 'Module Manufacturer'),
                CustomInput(fieldName: 'Manufacturing Country'),
                CustomNumberInput(fieldName: 'Module Manufacturing Year'),
                Text(
                  "Electrical Company",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                FormBuilderDropdown(
                  name: 'Electrical Company',
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                  ),
                  items: ['LECO', 'CEB']
                      .map(
                        (company) => DropdownMenuItem(
                          value: company,
                          child: Text(company),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 12),
                SizedBox(height: 12),
                CustomNumberInput(fieldName: 'Module Weight'),
                CustomNumberInput(fieldName: 'Max System Voltage'),
                CustomNumberInput(fieldName: 'Nominal Power'),
                CustomNumberInput(fieldName: 'Nominal Voltage'),
                CustomNumberInput(fieldName: 'Nominal Current'),
                FormBuilderSlider(
                  name: 'Module Efficiency',
                  decoration: const InputDecoration(
                    labelText: 'Module Efficiency (%)',
                  ),
                  min: 1,
                  max: 100,
                  initialValue: 50,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: const Text('Next'),
                    // ),

                    CustomButton(text: "Next", onPressed: buttonNext)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
