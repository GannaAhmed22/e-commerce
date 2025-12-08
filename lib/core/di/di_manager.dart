// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';
// import 'di_manager.config.dart';

// final getIt = GetIt.instance;

// @InjectableInit(
//   initializerName: 'init', // default
//   preferRelativeImports: true, // default
//   asExtension: true, // default
// )
// void configureDependencies() => getIt.init();

// lib/di_manager.dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di_manager.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

// Add this function to register dependencies manually if needed
Future<void> setupDependencies() async {
  configureDependencies();
  
  // If you need to register anything manually, do it here
  // getIt.registerFactory<SomeClass>(() => SomeClass());
}