import 'package:flutter/material.dart';
import 'package:meme_generator/core/entity/sample_entity.dart';
import 'package:meme_generator/features/widget/sample_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<SampleEntity> samples = [];

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: samples.length,
        itemBuilder: (context, index) => SampleCard(sample: samples[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      );
}
