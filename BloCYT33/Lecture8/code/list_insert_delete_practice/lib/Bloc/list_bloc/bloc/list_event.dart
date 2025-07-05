part of 'list_bloc.dart';

@immutable
sealed class ListEvent {
  const ListEvent();
}

class AddEvent extends ListEvent {
  final String item;
  const AddEvent(this.item);
}

class DeleteEvent extends ListEvent {
  final String item;
  const DeleteEvent(this.item);
}
