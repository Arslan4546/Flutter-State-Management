import 'package:flutter_riverpod/flutter_riverpod.dart';

// this is the search notifier that manages the search state
// it extends StateNotifier and holds a string state for the search query
// final searchProvider = StateNotifierProvider<SearchNotifier, String>((ref) {
//   return SearchNotifier();
// });

// class SearchNotifier extends StateNotifier<String> {
//   SearchNotifier() : super('');

//   void search(String query) {
//     state = query;
//   }

//   void clearSearch() {
//     state = '';
//   }
// }
/// ye jo uper wala code hai ye , just single search ke liye hai ab hum multiple stateNotifier banayenge
final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((
  ref,
) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '', isChanged: false));

  void search(String query) {
    state = state.copyWith(search: query);
  }

  void onChange(bool isChange) {
    state = state.copyWith(isChanged: isChange);
  }
}

class SearchState {
  final String search;
  final bool isChanged;
  SearchState({required this.search, required this.isChanged});
  SearchState copyWith({String? search, bool? isChanged}) {
    return SearchState(
      search: search ?? this.search,
      isChanged: isChanged ?? this.isChanged,
    );
  }
}
