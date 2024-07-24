import 'package:flutter/material.dart';
import '../models/watch_model.dart';

final List<WatchModel> guessWatches = _generateWatches('GUESS', 'guess');
final List<WatchModel> mkWatches = _generateWatches('MICHAEL KORS', 'mk');
final List<WatchModel> swWatches = _generateWatches('SWAROVSKI', 'sw');
final List<WatchModel> tommyWatches = _generateWatches('TOMMY HILFIGER', 'tommy');
final List<WatchModel> versaceWatches = _generateWatches('VERSACE', 'versace');

List<WatchModel> _generateWatches(String name, String prefix) {
  return List.generate(
    6,
    (index) => WatchModel(
      name: name,
      imgAddress: 'assets/images/$prefix${index + 1}.webp',
      price: (index + 1) * 1000.0,
      modelColor: Colors.white,
    ),
  );
}

List<WatchModel> itemsOnBag = [];

final List<String> categories = [
  'GUESS',
  'MICHAEL KORS',
  'SWAROVSKI',
  'TOMMY HILFIGER',
  'VERSACE'
];
