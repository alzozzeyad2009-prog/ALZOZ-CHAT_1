import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = '+20'; // كود الدولة الافتراضي

  final List<Map<String, String>> _countryCodes = [
    {'code': '+20', 'name': 'مصر 🇪🇬'},
    {'code': '+966', 'name': 'السعودية 🇸🇦'},
    {'code': '+971', 'name': 'الإمارات 🇦🇪'},
    {'code': '+1', 'name': 'أمريكا / كندا 🇺🇸'},
    {'code': '+44', 'name': 'المملكة المتحدة 🇬🇧'},
    // يمكن إضافة باقي دول العالم هنا
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'أدخل رقم هاتفك للمتابعة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                DropdownButton<String>(
                  value: _selectedCountryCode,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCountryCode = newValue!;
                    });
                  },
                  items: _countryCodes.map((country) {
                    return DropdownMenuItem<String>(
                      value: country['code'],
                      child: Text('${country['code']} (${country['name']})'),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'رقم الهاتف',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String fullPhoneNumber = '$_selectedCountryCode${_phoneController.text}';
                // إرسال الرقم الكامل بالصيغة الدولية (+20xxxxxxxxxx) لخدمة التحقق
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('إرسال رمز التحقق'),
            ),
          ],
        ),
      ),
    );
  }
}