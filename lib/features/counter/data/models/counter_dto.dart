import 'package:equatable/equatable.dart';

class CounterDto extends Equatable {
  // TODO adjust with your own model data
  final String id;

  const CounterDto({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}