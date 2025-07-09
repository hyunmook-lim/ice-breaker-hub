import 'package:ice_breaker_hub/games/combine_words/combine_words_page.dart';
import 'package:ice_breaker_hub/games/fastest_images/fastest_images_page.dart';
import 'package:ice_breaker_hub/games/guessing_sounds/guessing_sounds_page.dart';
import 'package:ice_breaker_hub/games/guessing_words/guessing_words_page.dart';
import 'package:ice_breaker_hub/games/initial_letters/initial_letters_page.dart';
import 'package:ice_breaker_hub/games/magnificated_images/magnificated_images_page.dart';
import 'package:ice_breaker_hub/games/puzzles/puzzles_page.dart';
import 'package:ice_breaker_hub/games/reading_glasses/reading_glasses_page.dart';
import 'package:ice_breaker_hub/games/right_or_wrong/right_or_wrong_page.dart';

import 'game_item.dart';

final List<GameItem> gameItems = [
  GameItem(
      name: '돋보기 게임',
      page: const ReadingGlassesPage(
        title: '돋보기 게임',
      )),
  GameItem(
      name: '초성 게임',
      page: const InitialLettersPage(
        title: '초성 게임',
      )),
  GameItem(
      name: '스무 고개',
      page: const GuessingWordsPage(
        title: '스무 고개',
      )),
  GameItem(
      name: '그림 확대 게임',
      page: const MagnificatedImages(
        title: '그림 확대 게임',
      )),
  GameItem(
      name: '빠르게 지나가는 그림',
      page: const FastestImagesPage(
        title: '빠르게 지나가는 그림',
      )),
  GameItem(
      name: '소리듣고 맞추기',
      page: const GuessingSoundsPage(
        title: '소리듣고 맞추기',
      )),
  GameItem(
      name: 'OX 퀴즈',
      page: const RightOrWrongPage(
        title: 'OX 퀴즈',
      )),
  GameItem(
      name: '음절 조합 게임',
      page: const CombineWordsPage(
        title: '음절 조합 게임',
      )),
  GameItem(
      name: '퍼즐 게임',
      page: const PuzzlesPage(
        title: '퍼즐 게임',
      )),
  // 필요한 만큼 추가 가능
];
