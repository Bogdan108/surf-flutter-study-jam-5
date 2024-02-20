import 'package:flutter/material.dart';
import 'package:meme_generator/core/entity/sample_entity.dart';

class SampleCard extends StatelessWidget {
  const SampleCard({super.key, required this.sample});

  final SampleEntity sample;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ()),
        // );
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
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                sample.urlToImage,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sample.title, style: theme.textTheme.titleMedium),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
