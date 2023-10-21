import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String title;
  final String description;
  final String? imageUrl;

  const Character({
    required this.title,
    required this.description,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [title, description, imageUrl];
}
