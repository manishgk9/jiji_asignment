import 'package:flutter_bloc/flutter_bloc.dart';
import 'jiji_state.dart';

class JijiCubit extends Cubit<JijiState> {
  JijiCubit() : super(const JijiState());

  void updateQuery(String value) {
    emit(state.copyWith(query: value));
  }
}
