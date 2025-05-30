part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> initialization() async {
  // final imagePicker = ImagePicker();
  // final modelDownloader = FirebaseModelDownloader.instance;

  // await _initCore(
  //   modelDownloader: modelDownloader,
  //   imagePicker: imagePicker,
  // );
  // initiate your dependency asynchronously but still parallel
  await Future.wait([
    _initHome(),
    // Feature A
    // Feature B
  ]);
}

// Future<void> _initCore({
//   required FirebaseModelDownloader modelDownloader,
//   required ImagePicker imagePicker,
// }) async {
//   sl
//     ..registerLazySingleton(() => modelDownloader)
//     ..registerLazySingleton(() => imagePicker);
// }

Future<void> _initHome() async {
  sl
    // Bloc
    ..registerFactory(() => HomeBloc(
          exampleUseCase: sl(),
        ))

    // Usecases
    ..registerLazySingleton(() => ExampleUseCase(repository: sl()))

    // Repository
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
          localDataSource: sl(),
        ))

    // Data Sources
    ..registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImpl(
          // imagePicker: sl(),
        ));
}

// Future<void> _initExample() async {
//   sl
//   // Bloc
//     ..registerFactory(() => ExampleBloc(
//       example: sl(),
//     ))
//
//   // Usecases
//     ..registerLazySingleton(() => ExampleUseCase(repository: sl()))
//
//   // Repository
//     ..registerLazySingleton<ExampleRepository>(
//             () => ExampleRepositoryImpl(
//           localDataSource: sl(),
//           remoteDataSource: sl(),
//         ))
//
//   // Data Sources
//     ..registerLazySingleton<ExampleLocalDataSource>(
//             () => ExampleLocalDataSourceImpl(
//           preferences: sl(),
//           filePicker: sl(),
//           imagePicker: sl(),
//         ))
//     ..registerLazySingleton<ExampleRemoteDataSource>(
//             () => ExampleRemoteDataSourceImpl(
//           dio: sl(),
//           api: sl(),
//           preferences: sl(),
//         ));
// }
