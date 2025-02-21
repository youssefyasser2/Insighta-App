// import 'package:drosak/src/core/resources/routes_mananger.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController fullNameController = TextEditingController();
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//     final TextEditingController confirmPasswordController =
//         TextEditingController();

//     Future<void> registerUser() async {
//       if (passwordController.text != confirmPasswordController.text) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Passwords do not match'),
//           ),
//         );
//         return;
//       }

//       try {
//         UserCredential userCredential =
//             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: emailController.text,
//           password: passwordController.text,
//         );
//         // عرض رسالة نجاح ونقل المستخدم إلى صفحة تسجيل الدخول
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Registration successful! Please log in.'),
//           ),
//         );
//         Navigator.pushReplacementNamed(context, RoutesName.kLoginScreenRoute);
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('The password provided is too weak.'),
//             ),
//           );
//         } else if (e.code == 'email-already-in-use') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('The account already exists for that email.'),
//             ),
//           );
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('An error occurred. Please try again.'),
//           ),
//         );
//       }
//     }

//     return Scaffold(
//       backgroundColor: const Color(0xff18171C), // Black background
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 50),
//               Center(
//                 child: CircleAvatar(
//                   radius: 40,
//                   backgroundColor: const Color(0xff8012DC), // Purple circle
//                   child: Image.asset(
//                     'assets/images/logo.png', // Replace with your logo path
//                     width: 40,
//                     height: 40,
//                     color: Colors.white, // White color for the logo
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'إنشاء حساب جديد',
//                 style: TextStyle(
//                   fontFamily: 'AA-GALAXY', // Custom font
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white, // White text
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'املأ النموذج أدناه للتسجيل',
//                 style: TextStyle(
//                   fontFamily: 'AA-GALAXY', // Custom font
//                   fontSize: 16,
//                   color: Colors.grey, // Grey text
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 40),
//               TextFormField(
//                 controller: fullNameController,
//                 decoration: InputDecoration(
//                   labelText: 'الاسم الكامل',
//                   labelStyle: const TextStyle(color: Colors.grey),
//                   filled: true,
//                   fillColor: const Color(0xff292A33), // Dark grey background
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                         color: Color(0xff8012DC)), // Purple border
//                   ),
//                   prefixIcon: const Icon(Icons.person, color: Colors.grey),
//                 ),
//                 style: const TextStyle(color: Colors.white), // White text
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: 'البريد الإلكتروني',
//                   labelStyle: const TextStyle(color: Colors.grey),
//                   filled: true,
//                   fillColor: const Color(0xff292A33), // Dark grey background
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                         color: Color(0xff8012DC)), // Purple border
//                   ),
//                   prefixIcon: const Icon(Icons.email, color: Colors.grey),
//                 ),
//                 style: const TextStyle(color: Colors.white), // White text
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'كلمة السر',
//                   labelStyle: const TextStyle(color: Colors.grey),
//                   filled: true,
//                   fillColor: const Color(0xff292A33), // Dark grey background
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                         color: Color(0xff8012DC)), // Purple border
//                   ),
//                   prefixIcon: const Icon(Icons.lock, color: Colors.grey),
//                 ),
//                 style: const TextStyle(color: Colors.white), // White text
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: confirmPasswordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'تأكيد كلمة السر',
//                   labelStyle: const TextStyle(color: Colors.grey),
//                   filled: true,
//                   fillColor: const Color(0xff292A33), // Dark grey background
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                         color: Color(0xff8012DC)), // Purple border
//                   ),
//                   prefixIcon: const Icon(Icons.lock, color: Colors.grey),
//                 ),
//                 style: const TextStyle(color: Colors.white), // White text
//               ),
//               const SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: registerUser,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xff8012DC), // Purple button
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     elevation: 5, // Button shadow
//                   ),
//                   child: const Text(
//                     'إنشاء حساب',
//                     style: TextStyle(
//                       fontFamily: 'AA-GALAXY', // Custom font
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white, // White text
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacementNamed(
//                           context, RoutesName.kLoginScreenRoute);
//                     },
//                     child: const Text(
//                       'تسجيل الدخول',
//                       style: TextStyle(
//                         fontFamily: 'AA-GALAXY', // Custom font
//                         fontSize: 14,
//                         color: Color(0xff8012DC), // Purple text
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     'لديك حساب بالفعل؟',
//                     style: TextStyle(
//                       fontFamily: 'AA-GALAXY', // Custom font
//                       fontSize: 14,
//                       color: Colors.white, // White text
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}