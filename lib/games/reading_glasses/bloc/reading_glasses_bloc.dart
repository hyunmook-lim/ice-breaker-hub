import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:ice_breaker_hub/games/reading_glasses/bloc/reading_glasses_event.dart';
import 'package:ice_breaker_hub/games/reading_glasses/bloc/reading_glasses_state.dart';

class ReadingGlassesBloc
    extends Bloc<ReadingGlassesEvent, ReadingGlassesState> {
  ReadingGlassesBloc() : super(const ReadingGlassesState()) {
    on<AddImages>(_onAddImages);
    on<ClearImages>(_onClearImages);
  }

  void _onAddImages(AddImages event, Emitter<ReadingGlassesState> emit) {
    final updatedList = List<Uint8List>.from(state.images)
      ..addAll(event.images);
    emit(state.copyWith(images: updatedList));
  }

  void _onClearImages(ClearImages event, Emitter<ReadingGlassesState> emit) {
    emit(const ReadingGlassesState(images: []));
  }
}
