import 'package:appfyp/model/baseModel.dart';
import 'package:appfyp/model/itemmodel.dart';

class CategoryModel implements BaseModel {
  String categoryName;
  String categoryPathToPicture;
  List<ItemModel> listOfItem;

  CategoryModel(data) {
    this.categoryName = data['categoryName'];
    this.categoryPathToPicture = data['categoryPathToPicture'];
    if (data['listOfItem'] != null) {
      data['listOfItem'].forEach((item) {
        this.listOfItem.add(ItemModel(item));
      });
    }
  }

  @override
  toMap() {
    return {
      'categoryName': categoryName,
      'categoryPathToPicture': categoryPathToPicture,
      'listOfItem': listOfItem
    };
  }
}
