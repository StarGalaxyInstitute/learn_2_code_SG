// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constrant/common_widgets.dart';

class StudentPrivacypolicyPage extends StatelessWidget {
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
            text: "Privacy Policy",
            textSize: 16.0,
            textWeight: FontWeight.bold),
      ),
      body: ListView(
        children: [
          _buildSectionTitle('1. Introduction'),
          _buildSectionContent(
              'Educatory ("we," "our," or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, and safeguard your information when you use our education app ("App"). By using the App, you agree to this policy.'),
          _buildSectionTitle('2. Information We Collect'),
          _buildSectionContent('Personal Information'),
          _buildBulletPoints([
            'Name',
            'Email address',
            'Phone number',
            'Payment information (for subscription services)',
          ]),
          _buildSectionTitle('3. Data Usage'),
          _buildBulletPoints([
            'IP address',
            'Browser type and version',
            'Pages visited',
            'Time and date of visits',
            'Time spent on pages',
            'Unique device identifiers',
            'Diagnostic data',
          ]),
          _buildSectionTitle('4. Cookies and Tracking Technologies'),
          _buildSectionContent(
              'We use cookies and similar technologies to track activity on our App. You can set your browser to refuse cookies, but some App features may not work properly without them.'),
          _buildSectionTitle('5. How We Use Your Information'),
          _buildBulletPoints([
            'To provide and maintain our App',
            'To improve and personalize user experience',
            'To analyze usage patterns',
            'To develop new features',
            'To manage transactions and subscriptions',
            'To communicate with users',
            'To send emails',
            'To prevent fraud',
            'To analyze trends and demographics',
          ]),
          _buildSectionTitle('6. Sharing Your Information'),
          _buildBulletPoints([
            'With Service Providers: For tasks such as payment processing, data analysis, email delivery, hosting, customer service, and marketing.',
            'For Business Transfers: During negotiations or in the event of a merger, sale, or acquisition.',
            'With Affiliates: We may share information with affiliates who will adhere to this policy.',
            'With Business Partners: To offer certain products, services, or promotions.',
          ]),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: CommonWidgets()
          .textWidget(text: title, textSize: 16.0, textWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 5.0, bottom: 16.0, left: 10.0, right: 10.0),
      child: CommonWidgets().textWidget(
          text: content, textSize: 13.0, textWeight: FontWeight.w400),
    );
  }

  Widget _buildBulletPoints(List<String> points) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: points.map((point) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\u2022 ',
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: CommonWidgets().textWidget(
                      text: point, textSize: 13.0, textWeight: FontWeight.w400),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
