import 'package:dio/dio.dart';
import 'package:sua_musica_teste/features/home/data/datasources/localstorage/impl/home_cache_image_impl.dart';
import 'package:sua_musica_teste/features/home/data/datasources/services/home_impl_services.dart';
import 'package:sua_musica_teste/features/home/data/repositories/home_impl_repository.dart';


abstract class HomeFactoryRepository {
  static final repository = HomeImplRepository(
    plataformService: HomeImplServices(
      http: Dio(),
      homeCacheImage: HomeCacheImageImpl()
    ),
  );
}
