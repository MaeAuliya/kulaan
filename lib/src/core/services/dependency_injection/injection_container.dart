// import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:image_picker/image_picker.dart';

import '../../../features/authentication/data/datasources/authentication_remote_data_source.dart';
import '../../../features/authentication/data/repositories/authentication_repository_impl.dart';
import '../../../features/authentication/domain/repositories/authentication_repository.dart';
import '../../../features/authentication/domain/usecases/sign_in.dart';
import '../../../features/authentication/domain/usecases/sign_in_with_credential.dart';
import '../../../features/authentication/domain/usecases/sign_out.dart';
import '../../../features/authentication/presentation/bloc/authentication_bloc.dart';
import '../../../features/home/data/datasources/home_local_data_source.dart';
import '../../../features/home/data/repository/home_repository_impl.dart';
import '../../../features/home/domain/repository/home_repository.dart';
import '../../../features/home/domain/usecase/example_use_case.dart';
import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../network/api.dart';

part 'injection_container_main.dart';