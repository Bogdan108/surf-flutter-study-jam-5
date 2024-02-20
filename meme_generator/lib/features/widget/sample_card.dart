import 'package:flutter/material.dart';
import 'package:meme_generator/core/entity/sample_entity.dart';
import 'package:meme_generator/core/theme/custom_theme.dart';

class SampleCard extends StatelessWidget {
  const SampleCard({super.key, required this.sample});

  final SampleEntity sample;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, sample.route);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  sample.urlToImage,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Center(
                  child: Text(
                    sample.title,
                    style: TextStyle(color: theme.colorScheme.background),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
