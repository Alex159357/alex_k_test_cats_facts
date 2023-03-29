import 'package:alex_k_test_cats_facts/src/config/constaints/ui_constaints.dart';
import 'package:alex_k_test_cats_facts/src/utils/extantions/context_extantion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/injection_container.dart';
import '../../domain/entities/cats_facts_pages.dart';
import '../blocs/cat_cubit_navigation/cat_bloc_navigation_cubit.dart';
import '../blocs/cat_cubit_navigation/cat_bloc_navigation_state.dart';
import '../blocs/cats_fact_blocs/cats_fact_blocs_bloc.dart';
import 'cat_facts_history_page.dart';
import 'cats_facts_page.dart';

class CatFactHomePage extends StatelessWidget {
  const CatFactHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CatBlocNavigationCubit>(create: (context)=>getIt.get<CatBlocNavigationCubit>()),
        BlocProvider<CatsFactBlocs>(create: (context)=> getIt.get<CatsFactBlocs>()),
      ],
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _getCatFactsView,
        bottomNavigationBar: _getBottomNavigationBar,
      ),
    );
  }

  Widget get _getCatFactsView =>
      BlocBuilder<CatBlocNavigationCubit, CatBlocNavigationState>(
        builder: (BuildContext context, state) {
          return AnimatedSwitcher(
            duration: DEFAULTANIMATIONDURATION,
            child: _getPage(state.currantPage),
          );
        },
      );

  Widget get _getBottomNavigationBar =>
      BlocBuilder<CatBlocNavigationCubit, CatBlocNavigationState>(
        builder: (BuildContext context, state) {
          return BottomNavigationBar(
            currentIndex: CatsFactsPages.values.indexOf(state.currantPage),
            onTap: (v) =>
                context.catFactsNavCubit.switchToPage(CatsFactsPages.values[v]),
            items: [
              for (CatsFactsPages page in CatsFactsPages.values)
                BottomNavigationBarItem(
                    icon: Icon(page.icon), label: page.pageTitle)
            ],
          );
        },
      );

  Widget _getPage(CatsFactsPages page) {
    switch (page) {
      case CatsFactsPages.RANDOM_FACTS:
        return const CatsFactsPage();
      case CatsFactsPages.HISTORY:
        return const CatFactsHistoryPage();
    }
  }
}
