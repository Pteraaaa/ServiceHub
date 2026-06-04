import 'package:flutter/material.dart';

import '../models/user_models.dart';
import '../services/auth_services.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';
import '../widgets/social_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullNameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  bool agree = false;

  final authService = AuthService();

  Future<void> register() async {
    try {
      final user = UserModel(
        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
      );

      await authService.register(
        user: user,
        password: passwordController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration Success")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Container(
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              children: [
                const Icon(Icons.settings, color: Color(0xFFFF6B00), size: 40),

                const SizedBox(height: 12),

                const Text(
                  "Daftar Akun",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Mulai perjalanan perawatan kendaraan Anda",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                CustomTextField(
                  label: "Nama Lengkap",
                  hint: "John Doe",
                  controller: fullNameController,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  label: "Email",
                  hint: "nama@email.com",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  label: "No. Telepon",
                  hint: "+62 812 3456 7890",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 16),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Kata Sandi"),
                ),

                const SizedBox(height: 8),

                PasswordTextField(controller: passwordController),

                CheckboxListTile(
                  value: agree,
                  onChanged: (value) {
                    setState(() {
                      agree = value!;
                    });
                  },
                  title: const Text("Saya menyetujui syarat & ketentuan"),
                  contentPadding: EdgeInsets.zero,
                ),

                const SizedBox(height: 10),

                CustomButton(text: "Daftar Sekarang", onPressed: register),

                const SizedBox(height: 30),

                const Text("ATAU"),

                const SizedBox(height: 20),

                Row(
                  children: [
                    SocialButton(
                      text: "Google",
                      icon: Icons.g_mobiledata,
                      onPressed: () {},
                    ),

                    const SizedBox(width: 10),

                    SocialButton(
                      text: "Facebook",
                      icon: Icons.facebook,
                      onPressed: () {},
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
