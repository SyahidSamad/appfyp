import 'package:appfyp/model/baseModel.dart';

class ItemModel implements BaseModel {
  String name;
  String pathToPicture;
  String pathToSound;
  String pathToVideo;

  @override
  toMap() {
    return {};
  }
}
