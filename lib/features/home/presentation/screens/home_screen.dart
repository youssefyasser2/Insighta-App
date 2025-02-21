import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الرئيسية')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'مرحباً بكم في الصفحة الرئيسية!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // هنا يمكنك وضع منطق التنقل أو تنفيذ مهمة معينة
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم الضغط على الزر!')),
                );
              },
              child: const Text('اضغط هنا'),
            ),
          ],
        ),
      ),
    );
  }
}
