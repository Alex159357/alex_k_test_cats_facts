import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../futures/cat_facts/presentation/blocs/cat_cubit_navigation/cat_bloc_navigation_cubit.dart';
import '../../futures/cat_facts/presentation/blocs/cats_fact_blocs/cats_fact_blocs_bloc.dart';

extension ContextExtantion on BuildContext {
  CatBlocNavigationCubit get catFactsNavCubit =>
      BlocProvider.of<CatBlocNavigationCubit>(this);

  CatsFactBlocs get catFactsBloc => BlocProvider.of<CatsFactBlocs>(this);

  String getLocalFormateDate(DateTime dateTime) {
    String timeFormat = MediaQuery.of(this).alwaysUse24HourFormat ? "HH" : "hh";
    return DateFormat('yyyy-MM-dd – $timeFormat:mm').format(dateTime);
  }
}
