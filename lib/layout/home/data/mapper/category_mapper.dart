import 'package:ecommerce/layout/home/data/models/category_response_model.dart';
import 'package:ecommerce/layout/home/domain/entities/category_entity.dart';

class CategoryMapper {
  static List<CategoryEntity> entityToModel(CategoriesResponse obj) {
    return obj.data!.map((item){
      return CategoryEntity(id: item.id??"",image:item.image??"" ,name: item.name??"",slug:item.slug??"");
    }).toList();
  }
}
