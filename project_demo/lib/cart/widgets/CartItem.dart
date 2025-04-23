import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/local/database_helper.dart';
import 'package:project_demo/utils/colors.dart';

import '../../models/CartItem.dart';

class CartItemView extends StatefulWidget {
  CartItemView({super.key, required this.cartItem, required this.onDeleteItem});

  CartItem cartItem;
  Function onDeleteItem;

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0.r),

                child: Image.network(
                  widget.cartItem.image ?? " ",
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.fade,
                          widget.cartItem.name ?? " ",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        icon: Icon(Icons.close, color: Colors.red),
                        onPressed: () async {
                          int deleted = await databaseHelper.deleteCartItem(
                            widget.cartItem.id ?? 0,
                          );
                          widget.onDeleteItem();

                          if (deleted > 0) {
                            final snackBar = SnackBar(
                              content: Text("Item Deleted Successful"),

                              backgroundColor: Color(MainColor),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(snackBar);
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '\$${0.3}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Color(MainColor),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.remove_circle_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          if (widget.cartItem.quantity! > 1) {
                            widget.cartItem.quantity;
                          }
                        },
                      ),
                      Text(widget.cartItem.quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add_circle, color: Colors.grey),
                        onPressed: () {
                          widget.cartItem.quantity;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
