import 'package:alex_k_test_cats_facts/src/futures/cat_facts/domain/entities/cat_fact_entity.dart';
import 'package:alex_k_test_cats_facts/src/futures/cat_facts/presentation/widgets/cat_fact_text_widget.dart';
import 'package:alex_k_test_cats_facts/src/utils/extantions/context_extantion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constaints/error_messages.dart';
import '../blocs/cats_fact_blocs/cats_fact_blocs_bloc.dart';
import '../blocs/cats_fact_blocs/cats_fact_blocs_state.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_display.dart';

class CatFactsHistoryPage extends StatelessWidget {
  const CatFactsHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.catFactsBloc.loadRandomCatFactHistory;
    return _getHistoryList;
  }

  Widget get _getHistoryList => BlocBuilder<CatsFactBlocs, CatsFactState>(
        builder: (BuildContext context, state) {
          if (state.didFactLoading) {
            return const LoadingWidget();
          } else {
            if (state.error.isNotEmpty) {
              return MessageDisplay(
                message: state.error,
              );
            } else if (state.catFactEntity != null) {
              // return Column(
              //   children: [
              //     for (CatFactEntity catFactHistoryItem
              //         in state.catsHistoryList)
              //       CatFactTextWidget(
              //           text: catFactHistoryItem.text,
              //           createdAt: context
              //               .getLocalFormateDate(catFactHistoryItem.createdAt))
              //   ],
              // );

              return ListView.builder(
                  shrinkWrap: false,
                  itemCount: state.catsHistoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final catFactHistoryItem = state.catsHistoryList[index];
                    return CatFactTextWidget(
                        text: catFactHistoryItem.text,
                        createdAt: context
                            .getLocalFormateDate(catFactHistoryItem.createdAt));
                  });
            } else {
              return const MessageDisplay(message: UNEXPECTED_ERROR);
            }
          }
        },
      );
}
