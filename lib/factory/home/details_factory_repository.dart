import 'package:dio/dio.dart';
import 'package:sua_musica_teste/features/details/data/datasources/services/details_impl_services.dart';
import 'package:sua_musica_teste/features/details/data/repositories/details_impl_repository.dart';



abstract class DetailsFactoryRepository {
  static final repository = DetailsImplRepository(
    services: DetailsImplServices(
      http: Dio(),
    ),
  );
}
