import 'package:ecommerce/layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce/layout/home/domain/usecases/get_categories.dart';
import 'package:ecommerce/layout/home/presentation/view_model/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoryViewCubit extends Cubit<CategoryViewState> {
  final GetCategoriesUsecase _getCategories;
  CategoryViewCubit(this._getCategories) : super(InitViewState());
  final List<CategoryEntity> categories = [];
  CategoryEntity getCategory(index)=>categories[index];
  void getCategories() async {
    if (categories.isEmpty) {
      emit(LoadingitemsState());
      final response = await _getCategories.invoke();
      response.fold(
        (failure) {
          emit(ErrorState(errorMsg: "failed Loading"));
        },
        (items) {
          categories.addAll(items);
          emit(SuccessState());
        },
      );
    }
    return;
  }
}
