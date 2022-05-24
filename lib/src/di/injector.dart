import 'package:get_it/get_it.dart';

final injection = GetIt.instance;

abstract class Injector {
  void injection(GetIt injector);
}
