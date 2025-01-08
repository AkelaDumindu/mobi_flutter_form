import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobitel_test/screens/next_screen.dart';

class AddSiteDataForm extends StatelessWidget {
  const AddSiteDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add Site Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderTextField(
                  name: 'module_manufacturer',
                  decoration: InputDecoration(labelText: 'Module Manufacturer'),
                  validator: FormBuilderValidators.required(),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'manufacturing_country',
                  decoration:
                      InputDecoration(labelText: 'Manufacturing Country'),
                  validator: FormBuilderValidators.required(),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'module_manufacturing_year',
                  decoration:
                      InputDecoration(labelText: 'Module Manufacturing Year'),
                  validator: FormBuilderValidators.integer(),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                FormBuilderDropdown(
                  name: 'electrical_company',
                  decoration: InputDecoration(labelText: 'Electrical Company'),
                  items: ['LECO', 'CEB']
                      .map((company) => DropdownMenuItem(
                            value: company,
                            child: Text(company),
                          ))
                      .toList(),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'module_weight',
                  decoration: InputDecoration(labelText: 'Module Weight'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.integer(),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'max_system_voltage',
                  decoration: InputDecoration(labelText: 'Max System Voltage'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.integer(),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'nominal_power',
                  decoration: InputDecoration(labelText: 'Nominal Power'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.integer(),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'nominal_voltage',
                  decoration: InputDecoration(labelText: 'Nominal Voltage'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.integer(),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: 'nominal_current',
                  decoration: InputDecoration(labelText: 'Nominal Current'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.integer(),
                ),
                SizedBox(height: 16),
                FormBuilderSlider(
                  name: 'module_efficiency',
                  decoration:
                      InputDecoration(labelText: 'Module Efficiency (%)'),
                  min: 1,
                  max: 100,
                  initialValue: 50,
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.saveAndValidate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NextScreen(
                                formData: formKey.currentState!.value,
                              ),
                            ),
                          );
                        } else {}
                      },
                      child: Text('Next'),
                    ),
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
