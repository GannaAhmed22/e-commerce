abstract class CategoryViewState {
  CategoryViewState();
}
class InitViewState extends CategoryViewState{}
class LoadingitemsState extends CategoryViewState{}
class SuccessState extends CategoryViewState{}
class ErrorState extends CategoryViewState{
  final String errorMsg;
  ErrorState({required this.errorMsg});
}