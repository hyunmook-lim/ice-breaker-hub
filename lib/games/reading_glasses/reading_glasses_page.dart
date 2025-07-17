import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_breaker_hub/games/reading_glasses/bloc/reading_glasses_bloc.dart';
import 'package:ice_breaker_hub/games/reading_glasses/reading_glasses_game_making_widget.dart';

class ReadingGlassesPage extends StatelessWidget {
  const ReadingGlassesPage({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Waguri',
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        actions: const [SizedBox(width: 48)], // leading과 symmetry 맞추기용
      ),
      body: BlocProvider(
        create: (_) => ReadingGlassesBloc(),
        child: ReadingGlassesGameMakingWidget(),
      ),
    );
  }
}
