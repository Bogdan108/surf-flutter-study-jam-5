import 'package:flutter/material.dart';
import 'package:meme_generator/core/entity/sample_entity.dart';
import 'package:meme_generator/features/widget/sample_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Страница с шаблонами',
          style: theme.textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: _NewsList(),
    );
  }
}

class _NewsList extends StatelessWidget {
  final List<SampleEntity> samples = [
    const SampleEntity(
        title: "Базовый шаблон",
        urlToImage: "assets/images/single_picture.png",
        route: "/detail_page_double_text"),
    const SampleEntity(
        title: "Двойной шаблон",
        urlToImage: "assets/images/double_text.png",
        route: "/detail_page_single_picture"),
  ];

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: samples.length,
        itemBuilder: (context, index) => SampleCard(sample: samples[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      );
}
