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

Future<void> setupDependencies() async {
  configureDependencies();
  
  
}
/*   ---- explain this file in details
 GetIt is like a "global container" or "toy box"
 Injectable is like a "robot helper" that automatically:
  1. Finds all your services
  2. Figures out their dependencies
  3. Registers them in GetIt
Without it, you'd have to write ALL registration code manually
'di_manager.config.dart' => This is a GENERATED file (auto-created by injectable)



*/