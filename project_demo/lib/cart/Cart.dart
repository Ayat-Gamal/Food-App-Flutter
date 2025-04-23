import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/cart/cubit/cart_cubit.dart';
import 'package:project_demo/cart/widgets/BottomSheetWidget.dart';
import 'package:project_demo/cart/widgets/CartItemList.dart';
import 'package:project_demo/cart/widgets/CustomPromoCodeEdt.dart';
import 'package:project_demo/cart/widgets/SummaryWidget.dart';
import 'package:project_demo/cart/widgets/TopPart.dart';

import '../local/database_helper.dart';
import '../models/CartItem.dart';

class Cart extends StatefulWidget {
  Cart({super.key });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final DatabaseHelper databaseHelper = DatabaseHelper();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartCubit>().getAllCartItems();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopPart(),
                  CartItemList(
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: "Promo Code",
                    onAddPressed: () {},
                  ),
                  buildSummarySection(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: buildBottomCheckoutSection(context),
    );
  }
}

Widget buildSummarySection() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryWidget(title: "Subtotal", value: "\$12.20"),

        SummaryWidget(title: "Tax and Fees", value: "\$4.10"),
        SummaryWidget(title: "Delivery", value: "\$1.00"),
      ],
    ),
  );
}
