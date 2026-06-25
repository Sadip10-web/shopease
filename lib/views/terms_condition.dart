import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  final String language;

  const TermsConditionsPage({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          language == "English" ? "Terms & Conditions" : "नियम तथा सर्तहरू",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            language == "English"
                ? """
1. Use this application responsibly.

2. Do not misuse any feature.

3. Your data remains protected.

4. By using this app you agree to our terms.

5. We may update these terms in future.
"""
                : """
१. एप जिम्मेवारीपूर्वक प्रयोग गर्नुहोस्।

२. कुनै पनि सुविधा दुरुपयोग नगर्नुहोस्।

३. तपाईंको डाटा सुरक्षित राखिन्छ।

४. एप प्रयोग गर्दा तपाईं नियमहरूमा सहमत हुनुहुन्छ।

५. भविष्यमा नियमहरू अद्यावधिक हुन सक्छन्।
""",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
