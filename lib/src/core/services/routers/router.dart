import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/authentication/presentation/bloc/authentication_bloc.dart';
import '../../../features/authentication/presentation/screens/sign_in_screen.dart';
import '../../../features/authentication/presentation/screens/splash_screen.dart';
import '../../../features/cart/presentation/bloc/cart_bloc.dart';
import '../../../features/cart/presentation/screens/cart_seller_screen.dart';
import '../../../features/cart/presentation/screens/detail_seller_screen.dart';
import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/navigation/presentation/views/user_bottom_navigation.dart';
import '../../shared/screens/page_under_construction.dart';
import '../dependency_injection/injection_container.dart';

part 'router_main.dart';
