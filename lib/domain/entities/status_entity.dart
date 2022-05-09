import 'package:equatable/equatable.dart';

class StatusEntity extends Equatable {
  const StatusEntity();

  @override
  List<Object> get props => [];
}

class IdleStatus extends StatusEntity {}

class DoneStatus extends StatusEntity {}

class InProgressStatus extends StatusEntity {}

class ErrorStatus extends StatusEntity {}
