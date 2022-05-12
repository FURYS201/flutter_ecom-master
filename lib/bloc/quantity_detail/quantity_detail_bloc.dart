import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'quantity_detail_event.dart';

class QuantityDetailBloc extends Bloc<QuantityDetailEvent, int> {
  QuantityDetailBloc() : super(0) {
    on<QuantityDetailEvent>((event, emit) {
      // TODO: implement event handler
      switch (event) {
        case QuantityDetailEvent.increment:
          state + 1;
          break;
        case QuantityDetailEvent.decrement:
          state - 1;
          break;
        default:
          break;
      }
    });
  }
}
