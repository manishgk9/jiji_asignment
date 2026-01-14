import 'package:equatable/equatable.dart';

class JijiState extends Equatable {
  final String query;

  const JijiState({this.query = 'Explain RAG'});

  JijiState copyWith({String? query}) {
    return JijiState(query: query ?? this.query);
  }

  @override
  List<Object> get props => [query];
}
