import 'package:flutter/material.dart';
import 'package:url_shorter/feature/url_generator/presentation/widget/short_url_body_view.dart';

class ShortUrlPage extends StatelessWidget {
  const ShortUrlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ShortUrlBodyView(),
    );
  }
}
