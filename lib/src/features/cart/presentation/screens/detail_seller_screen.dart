import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/shared/widgets/core_app_bar.dart';
import '../../../../core/utils/core_utils.dart';
import '../../domain/entities/get_cart_seller_params.dart';
import '../bloc/cart_bloc.dart';
import '../views/detail_seller_view.dart';

class DetailSellerScreen extends StatefulWidget {
  const DetailSellerScreen({super.key});

  static const routeName = '/detail-seller';

  @override
  State<DetailSellerScreen> createState() => _DetailSellerScreenState();
}

class _DetailSellerScreenState extends State<DetailSellerScreen> {
  @override
  void initState() {
    context.cartProvider.initScreen();
    context.cartBloc.add(
        GetAllProductBySellerEvent(context.mapProvider.currentSeller!.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoreAppBar(
        title: context.mapProvider.currentSeller!.businessName,
        size: 18,
      ),
      backgroundColor: Colours.greySecondaryBackground,
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is GetAllProductBySellerError) {
            CoreUtils.showSnackBar(
              context: context,
              message: state.errorMessage,
              isError: true,
            );
          } else if (state is PostItemToCartError) {
            Navigator.pop(context);
            CoreUtils.showSnackBar(
              context: context,
              message: state.errorMessage,
              isError: true,
            );
          } else if (state is GetUserCartBySellerError) {
            CoreUtils.showSnackBar(
              context: context,
              message: state.errorMessage,
              isError: true,
            );
          } else if (state is GetAllProductBySellerSuccess) {
            context.cartProvider.initSellerProducts(state.products);
            final params = GetCartSellerParams(
              userId: context.userProvider.currentUser!.id,
              sellerId: state.products.first.sellerId,
            );
            context.cartBloc.add(GetUserCartBySellerEvent(params));
          } else if (state is PostItemToCartLoading) {
            CoreUtils.showLoadingDialog(context);
          } else if (state is GetUserCartBySellerSuccess) {
            context.cartProvider.initSellerCart(state.sellerCart);
          } else if (state is PostItemToCartSuccess) {
            context.cartProvider.initSellerCart(state.cart);
            Navigator.pop(context);
            CoreUtils.showSnackBar(
              context: context,
              message: 'Add Item to Car Success',
            );
          }
        },
        builder: (_, state) => DetailSellerView(currentState: state),
      ),
    );
  }
}
