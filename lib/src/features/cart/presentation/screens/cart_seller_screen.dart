import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/res/colours.dart';
import '../../../../core/shared/widgets/core_app_bar.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../navigation/presentation/views/user_bottom_navigation.dart';
import '../bloc/cart_bloc.dart';
import '../views/cart_seller_view.dart';

class CartSellerScreen extends StatefulWidget {
  const CartSellerScreen({super.key});

  static const routeName = '/cart-seller';

  @override
  State<CartSellerScreen> createState() => _CartSellerScreenState();
}

class _CartSellerScreenState extends State<CartSellerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CoreAppBar(title: 'Cart'),
      backgroundColor: Colours.greySecondaryBackground,
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CreateOrderError) {
            Navigator.pop(context);
            CoreUtils.showSnackBar(
              context: context,
              message: state.errorMessage,
              isError: true,
            );
          } else if (state is CreateOrderLoading) {
            CoreUtils.showLoadingDialog(context);
          } else if (state is CreateOrderSuccess) {
            Navigator.pop(context);
            CoreUtils.showSnackBar(
              context: context,
              message: 'Success',
            );
            Navigator.pushNamed(context, UserBottomNavigationCore.routeName);
          }
        },
        builder: (_, state) => const CartSellerView(),
      ),
    );
  }
}
