import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StackCubit extends Cubit<Offset> {
  StackCubit()
      : super(
          Offset.zero,
        );

  void notifyOffsetWidget(Offset offset) {
    emit(offset);
  }
}
