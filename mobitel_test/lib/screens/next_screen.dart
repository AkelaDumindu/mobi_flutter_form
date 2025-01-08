import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  final Map<String, dynamic> formData;

  const NextScreen({super.key, required this.formData});

  @override
  Widget build(BuildContext context) {
    print('Form Data on next page: $formData');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: const Text('Result')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Form Data:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: formData.keys.length,
                itemBuilder: (context, index) {
                  final key = formData.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      '$key: ${formData[key]}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
