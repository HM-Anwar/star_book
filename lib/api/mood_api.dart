import 'package:star_book/models/mood/mood.dart';

import '../packages/hive_collection.dart';
import 'base_api.dart';

abstract class IMoodApi extends BaseApi {
  static const String collectionName = 'moodCollection';
  Future<Mood> getById(String moodId);
}

class LSMoodApi extends IMoodApi {
  final HiveCollectionReference<Mood> collection;
  LSMoodApi({required this.collection});

  @override
  Future<Mood> getById(String moodId) async {
    return collection.doc(moodId)!.get();
  }
}