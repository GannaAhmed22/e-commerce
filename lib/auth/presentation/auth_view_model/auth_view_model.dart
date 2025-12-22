import 'package:ecommerce/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce/auth/domain/usecases/register_usecase.dart';
import 'package:ecommerce/auth/domain/usecases/update_data_usecase.dart';
import 'package:ecommerce/auth/domain/usecases/update_pass_usecase.dart';
import 'package:ecommerce/auth/presentation/auth_view_model/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthStates> {
  final RegisterUseCase _registerUseCase;
  final UpdateDataUsecase _updateDataUsecase;
  final UpdatePassUsecase _updatePassUsecase;
  final LoginUseCase _loginUseCase;
  AuthCubit(
    this._registerUseCase,
    this._loginUseCase,
    this._updateDataUsecase,
    this._updatePassUsecase,
  ) : super(InitAuthState());

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController userNameLoginController = TextEditingController();
  final TextEditingController passLoginController = TextEditingController();

  final TextEditingController profileNameController = TextEditingController();
  final TextEditingController profileEmailController = TextEditingController();
  final TextEditingController profilePhoneController = TextEditingController();
  final TextEditingController profileAddressController =
      TextEditingController();
  final TextEditingController profilePassController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final profileFormKey = GlobalKey<FormState>();

  // register
  Future<void> userRegister() async {
    emit(LoadingAuthState());
    final response = await _registerUseCase.invoke(
      emailController.text,
      userNameController.text,
      phoneNumController.text,
      passController.text,
      passController.text,
    );
    response.fold(
      (failure) => emit(ErrorAuthState(errorMsg: failure.errorMessage)),
      (_) => emit(SuccessAuthState()),
    );
  }

  // login
  Future<void> userLogin() async {
    emit(LoadingAuthState());
    final response = await _loginUseCase.invoke(
      userNameLoginController.text,
      passLoginController.text,
    );
    response.fold(
      (failure) => emit(ErrorAuthState(errorMsg: failure.errorMessage)),
      (_) => emit(SuccessAuthState()),
    );
  }

  Future<void> updatePassword() async {
    emit(LoadingAuthState());
    final response = await _updatePassUsecase.invoke("", "");
    response.fold(
      (failure) => emit(ErrorAuthState(errorMsg: failure.errorMessage)),
      (_) => emit(SuccessAuthState()),
    );
  }

  Future<void> updateProfileData() async {
    emit(LoadingAuthState());
    final response = await _updateDataUsecase.invoke(
      email: profileEmailController.text,
      name: profileNameController.text,
      phone: profilePhoneController.text,
    );
    response.fold(
      (failure) => emit(ErrorAuthState(errorMsg: failure.errorMessage)),
      (_) => emit(SuccessAuthState()),
    );
  }
}
