// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constrant/common_widgets.dart';

class StudentTermsandconditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: CommonWidgets().textWidget(
            text: "Tearms & Conditions",
            textSize: 16.0,
            textWeight: FontWeight.bold),
      ),
      body: ListView(
        children: [
          _buildSectionTitle('1. Service Agreement'),
          _buildSectionContent(
              'By using Educatory, you agree to abide by the following terms and conditions outlined herein.'),
          _buildSectionTitle('2. Scope of Services'),
          _buildSectionContent(
              'Educatory provides educational resources and tools to enhance learning experiences for students and educators. This includes but is not limited to interactive lessons, quizzes, and progress tracking.'),
          _buildSectionTitle('3. Service Limitations'),
          _buildSectionContent(
              'Users are required to create an account to access Educatory services. Accurate and complete information must be provided during registration. Users are responsible for maintaining the confidentiality of their account credentials.'),
          _buildSectionTitle('4. Payment'),
          _buildSectionContent(
              'Educatory may require payment. Payment is due at the time of service subscription. We accept credit/debit cards and electronic payments. Subscription fees and any additional charges will be clearly outlined.'),
          _buildSectionTitle('5. Cancellation Policy'),
          _buildSectionContent(
              'Users may cancel their subscription at any time. Cancellations must be made through the account settings. Refunds will be provided according to our refund policy outlined on our website.'),
          _buildSectionTitle('6. Liability'),
          _buildSectionContent(
              'All content provided on Educatory is for personal and non-commercial use. Users may not distribute, modify, transmit, reuse, or use the content for public or commercial purposes without explicit permission.'),
          _buildSectionTitle('7. Client Responsibilities'),
          _buildSectionContent(
              'Users are responsible for ensuring that their use of Educatory complies with all applicable laws and regulations. Any misuse of the platform, including but not limited to sharing offensive or inappropriate content, will result in the termination of the account.'),
          _buildSectionTitle('8. Warranty'),
          _buildSectionContent(
              'Educatory is committed to protecting user privacy. Personal information collected during registration and usage of the service will be handled according to our Privacy Policy, which can be accessed on our website.'),
          _buildSectionTitle('9. Indemnification'),
          _buildSectionContent(
              'Users agree to indemnify and hold harmless Educatory and its employees from any claims, damages, or liabilities arising from their use of the services provided.'),
          _buildSectionTitle('10. Modification of Terms'),
          _buildSectionContent(
              'Educatory reserves the right to modify or update these terms and conditions at any time. Users will be notified of any changes prior to their enforcement.'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: CommonWidgets()
          .textWidget(text: title, textSize: 16.0, textWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 10),
      child: CommonWidgets().textWidget(
          text: content, textSize: 13.0, textWeight: FontWeight.w400),
    );
  }
}
