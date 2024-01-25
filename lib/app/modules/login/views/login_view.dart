import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                    hintText: "Masukkan Username",
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.length < 1) {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                    hintText: "Masukkan Password",
                    icon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.length < 1) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
                width: 100,height: 20,
              child: Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red),
                  onPressed: () {
                    controller.login();
                  },
                  child: Text("Login",style: TextStyle(color: Colors.white),))),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 5),),
            SizedBox(
              width: 100,height: 20,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red),
                  onPressed: () => Get.toNamed(Routes.REGISTER),
                  child: Text("Daftar",style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      )),
    );
  }
}
