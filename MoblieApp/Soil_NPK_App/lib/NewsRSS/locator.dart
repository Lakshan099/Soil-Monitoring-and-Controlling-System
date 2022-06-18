import 'package:get_it/get_it.dart';
import 'package:soil_npk_app/NewsRSS/domain/article_controller.dart';
import 'package:soil_npk_app/NewsRSS/network/repository.dart';
import 'package:soil_npk_app/NewsRSS/network/repository_impl.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<Repository>(() => RepositoryImpl());
  locator.registerLazySingleton<ArticleController>(() => ArticleController());
}