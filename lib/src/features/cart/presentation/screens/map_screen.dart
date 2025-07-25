import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/cart_bloc.dart';
import '../views/map_views.dart';
import '../widgets/seller_bottom_sheet.dart';
import 'detail_seller_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  static const routeName = '/chart';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    context.cartBloc.add(const GetCurrentPositionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is GetCurrentPositionError) {
          CoreUtils.showSnackBar(
            context: context,
            message: state.errorMessage,
            isError: true,
          );
        } else if (state is GetAllSellerError) {
          CoreUtils.showSnackBar(
            context: context,
            message: state.errorMessage,
            isError: true,
          );
        } else if (state is GetCurrentPositionSuccess) {
          context.mapProvider.initPosition(state.currentPosition);
          context.cartBloc.add(const GetAllSellerEvent());
        } else if (state is GetAllSellerSuccess) {
          context.mapProvider.initLocations(state.sellers);
        } else if (state is ShowSellerBottomSheetSuccess) {
          final currentSeller = context.mapProvider.currentSeller!;
          showModalBottomSheet(
            context: context,
            barrierColor: Colors.black.withValues(alpha: 0.05),
            builder: (_) => SellerBottomSheet(
              name: currentSeller.businessName,
              type: currentSeller.businessType,
              description: currentSeller.description,
              address:
                  '${currentSeller.location.address}, ${currentSeller.location.district}, ${currentSeller.location.city}',
              time:
                  '${currentSeller.operatingTime.open} - ${currentSeller.operatingTime.close}',
              operatingDays: currentSeller.operatingTime.days,
              onVisitTap: () {
                Navigator.pushNamed(context, DetailSellerScreen.routeName);
              },
              onDirectionTap: () {},
            ),
          );
        }
      },
      builder: (_, state) => MapViews(
        currentState: state,
      ),
    );
  }
}
