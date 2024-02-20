import 'package:equatable/equatable.dart';

class SampleEntity extends Equatable {
  final String title;
  final String urlToImage;
  final String route;

  const SampleEntity({
    required this.title,
    required this.urlToImage,
    required this.route,
  });

  @override
  List<Object?> get props => [title, urlToImage, route];
}
