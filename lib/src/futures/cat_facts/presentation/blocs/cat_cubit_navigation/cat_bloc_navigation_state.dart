import '../../../domain/entities/cats_facts_pages.dart';

class CatBlocNavigationState {
  final CatsFactsPages currantPage;


  CatBlocNavigationState({this.currantPage = CatsFactsPages.RANDOM_FACTS});

  CatBlocNavigationState init() {
    return CatBlocNavigationState();
  }

  CatBlocNavigationState clone({CatsFactsPages? currantPage}) {
    return CatBlocNavigationState(currantPage: currantPage ?? this.currantPage);
  }
}
