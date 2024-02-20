import 'package:equatable/equatable.dart';

class SampleEntity extends Equatable {
  final String title;
  final String urlToImage;

  const SampleEntity({
    required this.title,
    required this.urlToImage,
  });

  @override
  List<Object?> get props => [title, urlToImage];
}
