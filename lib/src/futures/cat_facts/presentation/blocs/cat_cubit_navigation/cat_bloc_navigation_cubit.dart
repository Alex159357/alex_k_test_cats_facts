import 'package:bloc/bloc.dart';

import '../../../domain/entities/cats_facts_pages.dart';
import 'cat_bloc_navigation_state.dart';

class CatBlocNavigationCubit extends Cubit<CatBlocNavigationState> {
  CatBlocNavigationCubit() : super(CatBlocNavigationState());

  void switchToPage(CatsFactsPages page) => emit(state.clone(currantPage: page));
}

