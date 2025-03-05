import 'package:e_commercy/features/auth/data/repos/auth_repo.dart';
import 'package:e_commercy/features/auth/data/repos/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
}
