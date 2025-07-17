import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class ReadingGlassesEvent extends Equatable {
  const ReadingGlassesEvent();

  @override
  List<Object?> get props => [];
}

class AddImages extends ReadingGlassesEvent {
  final List<Uint8List> images;

  const AddImages(this.images);

  @override
  List<Object?> get props => [images];
}

class ClearImages extends ReadingGlassesEvent {
  const ClearImages();
}
