import 'package:appfyp/model/baseModel.dart';

class ItemModel implements BaseModel {
  String name;
  String pathToPicture;
  String pathToSound;
  String pathToVideo;

  ItemModel(data) {
    this.name = data['name'];
    this.pathToPicture = data['name'];
    this.pathToSound = data['pathToSound'];
    this.pathToVideo = data['pathToVideo'];
  }

  @override
  toMap() {
    return {};
  }
}
