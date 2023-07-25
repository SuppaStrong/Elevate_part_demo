import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/auth/auth_controller.dart';
import 'package:elevate_ecommerce/controllers/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController phoneController2 = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  int radioContinerIndes = 1;

  final paymentController = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildRadioContainer(
            address: "Nguyễn Ngọc Nại , Thanh Xuân , Hà Nội",
            name: authController.displayUserName.value,
            phone: "0833842320",
            title: "Your Home Adress",
            value: 1,
            color: Colors.white,
            icon: Container(),
            onChanged: (int? value) {
              setState(() {
                radioContinerIndes = value!;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => buildRadioContainer(
              address: "Lê Trọng Tấn , Thanh Xuân , Hà Nội",
              name: authController.displayUserName.value,
              phone: paymentController.phoneNumber.value,
              title: "Other Person Receiver For You",
              value: 2,
              color: Colors.white,
              icon: InkWell(
                onTap: () => dialogInput(
                  diallogTitle: "Enter your phone number",
                  dialogHintText: "Enter your phone number",
                  isPhoneNumber: true,
                  textController: phoneController,
                  onConfirm: () {
                    Get.back();
                    paymentController.phoneNumber.value = phoneController.text;
                  },
                ),
                child: const Icon(
                  Icons.contact_phone,
                  color: kPrimaryColor,
                  size: 20,
                ),
              ),
              onChanged: (int? value) {
                setState(() {
                  radioContinerIndes = value!;
                });
                //paymentController.updatePosition();
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => buildRadioContainer(
              address: paymentController.address.value,
              name: authController.displayUserName.value,
              phone: paymentController.phoneNumber2.value,
              title: "Your Location",
              value: 3,
              color: Colors.white,
              icon: InkWell(
                onTap: () => dialogInput(
                  diallogTitle: "Enter your phone number",
                  dialogHintText: "Enter your phone number",
                  isPhoneNumber: true,
                  textController: phoneController2,
                  onConfirm: () {
                    Get.back();
                    paymentController.phoneNumber2.value =
                        phoneController2.text;
                  },
                ),
                child: const Icon(
                  Icons.contact_phone,
                  color: kPrimaryColor,
                  size: 20,
                ),
              ),
              onChanged: (int? value) {
                setState(() {
                  radioContinerIndes = value!;
                });
                paymentController.updatePosition();
              },
            ),
          ),
        ],
      ),
    );
  }

  void dialogInput({
    required String diallogTitle,
    required String dialogHintText,
    required bool isPhoneNumber,
    required TextEditingController textController,
    required Function onConfirm,
  }) {
    Get.defaultDialog(
      title: diallogTitle,
      titleStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.white,
      radius: 10,
      textCancel: " Exit ",
      confirmTextColor: Colors.white,
      textConfirm: " Save ",
      cancelTextColor: kPrimaryColor,
      onCancel: () {
        Get.toNamed("/address");
      },
      onConfirm: onConfirm as void Function(),
      buttonColor: kPrimaryColor,
      content: Padding(
        padding: const EdgeInsets.all(15),
        child: TextField(
          controller: textController,
          cursorColor: Colors.black,
          maxLength: isPhoneNumber ? 10 : 100,
          keyboardType: TextInputType.text,
          onSubmitted: (value) {
            phoneController.text = value;
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.red,
            prefixIcon: const Icon(
              Icons.phone,
              color: kPrimaryColor,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                phoneController.clear();
              },
              icon: const Icon(Icons.close, color: Colors.black),
            ),
            hintText: "Enter Your Phone Number",
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContinerIndes,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: body14,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  name,
                  style: body14,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('🇻🇳 +84 '),
                    Text(
                      phone,
                      style: body14,
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  address,
                  style: body14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
