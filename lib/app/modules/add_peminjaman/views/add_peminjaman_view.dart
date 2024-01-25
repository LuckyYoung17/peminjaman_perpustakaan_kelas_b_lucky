import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pinjam Buku ${Get.parameters['judul'].toString()}'),
          centerTitle: true,
        ),
        body: Center(
            child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: controller.tanggalPinjamController,
                  decoration: InputDecoration(
                      hintText: "Masukkan Tanggal Pinjam",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    if (value!.length < 1) {
                      return "Tanggal tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: controller.tanggalKembaliController,
                  decoration: InputDecoration(
                      hintText: "Masukkan Tanggal kembali",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    if (value!.length < 1) {
                      return "Tanggal tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 100,
                height: 25,
                child: Obx(() => controller.loading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          controller.pinjam();
                        },
                        child: Text(
                          "Pinjam",
                          style: TextStyle(color: Colors.white),
                        ))),
              )
            ],
          ),
        )));
  }
}
