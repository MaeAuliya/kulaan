part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> initialization() async {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final preference = await SharedPreferences.getInstance();
  final imagePicker = ImagePicker();
  final geolocator = GeolocatorPlatform.instance;

  await _initCore(
    auth: auth,
    preference: preference,
    imagePicker: imagePicker,
    geolocator: geolocator,
    firestore: firestore,
  );
  await Future.wait([
    _initAuthentication(),
    _initHome(),
  ]);
}

Future<void> _initCore({
  required FirebaseAuth auth,
  required SharedPreferences preference,
  required ImagePicker imagePicker,
  required GeolocatorPlatform geolocator,
  required FirebaseFirestore firestore,
}) async {
  sl
    ..registerLazySingleton(() => auth)
    ..registerLazySingleton(() => preference)
    ..registerLazySingleton(() => imagePicker)
    ..registerLazySingleton(() => firestore)
    ..registerLazySingleton(() => geolocator);
}

Future<void> _initAuthentication() async {
  sl
    // Bloc
    ..registerFactory(() => AuthenticationBloc(
          signIn: sl(),
          signInWithCredential: sl(),
          signOut: sl(),
        ))

    // Usecases
    ..registerLazySingleton(() => SignIn(repository: sl()))
    ..registerLazySingleton(() => SignInWithCredential(repository: sl()))
    ..registerLazySingleton(() => SignOut(repository: sl()))

    // Repository
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(
              remoteDataSource: sl(),
            ))

    // Data Sources
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
        () => AuthenticationRemoteDataSourceImpl(
              auth: sl(),
              firestore: sl(),
            ));
}

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
