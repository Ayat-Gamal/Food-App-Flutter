import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/models/CartItem.dart';

import '../../repositaory/Reposatiory.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Repository repo;

  CartCubit(this.repo) : super(CartInitial());

  Future<void>  getAllCartItems() async {
    emit(CartLoading());
    try {
      final cartItems = await repo.getAllCartItems();
      emit(CartSuccess(cartItems!));
     } catch (ex) {
      emit(CartError(ex.toString()));
     }
  }
}
