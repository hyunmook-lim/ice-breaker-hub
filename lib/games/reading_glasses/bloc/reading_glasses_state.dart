import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class ReadingGlassesState extends Equatable {
  final List<Uint8List> images;

  const ReadingGlassesState({
    this.images = const [],
  });

  ReadingGlassesState copyWith({
    List<Uint8List>? images,
  }) {
    return ReadingGlassesState(
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [
        images,
      ];
}
