import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/cart/cubit/cart_cubit.dart';

import 'cart_item.dart';

class CartItemList extends StatefulWidget {
  CartItemList({super.key});


  @override
  State<CartItemList> createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        switch (state) {
          case CartInitial():
            return Center(child: Text("Initial State"));

          case CartLoading():
            return Center(child: CircularProgressIndicator());

          case CartSuccess():
            final items = state.cartList;
            print(" Caaat ${items[0].category}");
            //Text("SSSSS");
          return  Container(
            height: 600.h,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CartItemView(
                    cartItem: items[index],
                    onDeleteItem: () {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                  );
                },
              ),
            );
          case CartError():
            return Center(child: Text(state.message));
        }
        return Center(child: Text(" "));
      },
    );
  }
}
