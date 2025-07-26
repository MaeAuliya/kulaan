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
    _initCart(),
    _initOrder(),
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
          getNews: sl(),
          getRecommendProduct: sl(),
        ))

    // Usecases
    ..registerLazySingleton(() => ExampleUseCase(repository: sl()))
    ..registerLazySingleton(() => GetNews(repository: sl()))
    ..registerLazySingleton(() => GetRecommendProduct(repository: sl()))

    // Repository
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
          localDataSource: sl(),
          remoteDataSource: sl(),
        ))

    // Data Sources
    ..registerLazySingleton<HomeLocalDataSource>(
        () => const HomeLocalDataSourceImpl())
    ..registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(
              firestore: sl(),
            ));
}

Future<void> _initCart() async {
  sl
    // Bloc
    ..registerFactory(() => CartBloc(
          getAllSeller: sl(),
          getAllProduct: sl(),
          getCurrentPosition: sl(),
          getAllProductBySeller: sl(),
          postItemToCart: sl(),
          getUserCartBySeller: sl(),
          createOrder: sl(),
        ))

    // Usecases
    ..registerLazySingleton(() => GetAllSeller(repository: sl()))
    ..registerLazySingleton(() => GetAllProduct(repository: sl()))
    ..registerLazySingleton(() => GetCurrentPosition(repository: sl()))
    ..registerLazySingleton(() => GetAllProductBySeller(repository: sl()))
    ..registerLazySingleton(() => PostItemToCart(repository: sl()))
    ..registerLazySingleton(() => GetUserCartBySeller(repository: sl()))
    ..registerLazySingleton(() => CreateOrder(repository: sl()))

    // Repository
    ..registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
          remoteDataSource: sl(),
        ))

    // Data Sources
    ..registerLazySingleton<CartRemoteDataSource>(
        () => CartRemoteDataSourceImpl(
              firestore: sl(),
            ));
}

Future<void> _initOrder() async {
  sl
    // Bloc
    ..registerFactory(() => HistoryBloc(
          getUserOrders: sl(),
        ))

    // Usecases
    ..registerLazySingleton(() => GetUserOrders(repository: sl()))

    // Repository
    ..registerLazySingleton<HistoryRepository>(() => HistoryRepositoryImpl(
          remoteDataSource: sl(),
        ))

    // Data Sources
    ..registerLazySingleton<HistoryRemoteDataSource>(
        () => HistoryRemoteDataSourceImpl(
              firestore: sl(),
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
