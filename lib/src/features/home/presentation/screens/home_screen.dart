import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../views/home_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.homeBloc.add(const GetNewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colours.blueVehicleDetailBackground,
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is GetNewsError) {
              CoreUtils.showSnackBar(
                context: context,
                message: state.errorMessage,
                isError: true,
              );
            } else if (state is GetRecommendProductError) {
              debugPrint(state.errorMessage);
              CoreUtils.showSnackBar(
                context: context,
                message: state.errorMessage,
                isError: true,
              );
            } else if (state is GetNewsSuccess) {
              context.homeProvider.initNews(state.listNews);
              context.homeBloc.add(const GetRecommendProductEvent());
            } else if (state is GetRecommendProductSuccess) {
              debugPrint('zzz: ${state.products}');
              context.homeProvider.initRecommendProduct(state.products);
            }
          },
          builder: (_, state) => HomeView(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
