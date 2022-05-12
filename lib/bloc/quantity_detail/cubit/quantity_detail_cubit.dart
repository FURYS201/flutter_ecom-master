import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class QuantityDetailCubit extends Cubit<int> {
  QuantityDetailCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
