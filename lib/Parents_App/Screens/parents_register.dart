// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/parents_logincontroller.dart';

class ParentsRegister extends StatelessWidget {
  final ParentsLogincontroller controller = Get.put(ParentsLogincontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_img.png',
                height: 200), // Replace with your image
            SizedBox(height: 20),
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                useBottomSheetSafeArea: true,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: PhoneNumber(isoCode: 'IN'),
              textFieldController: controller.phonecontroller,
              formatInput: true,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
            SizedBox(height: 10),
            TextField(
                controller: controller.studentidcontroller,
                decoration: InputDecoration(
                    labelText: 'Student Id', border: OutlineInputBorder())),
            SizedBox(height: 20),
            GestureDetector(
              onTap: controller.verifyPhoneNumber,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.btnBlue),
                child: Center(
                  child: CommonWidgets().textWidget(
                      text: 'Login',
                      textColor: AppColors.whitecolor,
                      textAlign: TextAlign.start,
                      textSize: 14.0,
                      textWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
