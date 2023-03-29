import 'package:alex_k_test_cats_facts/src/futures/cat_facts/presentation/widgets/cat_fact_text_widget.dart';
import 'package:alex_k_test_cats_facts/src/futures/cat_facts/presentation/widgets/loading_widget.dart';
import 'package:alex_k_test_cats_facts/src/utils/extantions/context_extantion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constaints/error_messages.dart';
import '../../../../config/constaints/ui_constaints.dart';
import '../blocs/cats_fact_blocs/cats_fact_blocs_bloc.dart';
import '../blocs/cats_fact_blocs/cats_fact_blocs_event.dart';
import '../blocs/cats_fact_blocs/cats_fact_blocs_state.dart';
import '../widgets/cat_image_widget.dart';
import '../widgets/message_display.dart';

class CatsFactsPage extends StatelessWidget {
  const CatsFactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.catFactsBloc.loadRandomCatFact;
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              _getImageContainer,
              _getFactView,
            ],
          ),
          _getNextButton
        ],
      ),
    );
  }

  Widget get _getImageContainer => BlocBuilder<CatsFactBlocs, CatsFactState>(
        builder: (BuildContext context, state) {
          return Container(
              padding: const EdgeInsets.all(DEFAULT_MARGIN),
              constraints: BoxConstraints(
                  maxWidth: MAX_IMAGE_WIDTH,
                  minWidth: MIN_IMAGE_WIDTH,
                  maxHeight: MediaQuery.of(context).size.height /
                      DEFAULT_IMAGE_PART_OF_SCREEN),
              child: state.didFactLoading || state.error.isNotEmpty
                  ? Container()
                  : state.catFactEntity != null
                      ? CatImageWidget(
                          imageUrl: state.imageUrl,
                          itemId: state.catFactEntity!.id,
                        )
                      : Container());
        },
      );

  Widget get _getFactView => BlocBuilder<CatsFactBlocs, CatsFactState>(
        builder: (BuildContext context, state) {
          return AnimatedSwitcher(
            duration: DEFAULTANIMATIONDURATION,
            child: _getFactBody(state, context),
          );
        },
      );

  Widget _getFactBody(CatsFactState state, BuildContext context) {
    if (state.didFactLoading) {
      return const LoadingWidget();
    } else {
      if (state.error.isNotEmpty) {
        return MessageDisplay(
          message: state.error,
        );
      } else if (state.catFactEntity != null) {
        return Column(
          children: [
            CatFactTextWidget(
                text: state.catFactEntity!.text,
                createdAt: context
                    .getLocalFormateDate(state.catFactEntity!.createdAt)),
          ],
        );
      } else {
        return const MessageDisplay(message: UNEXPECTED_ERROR);
      }
    }
  }

  Widget get _getNextButton => BlocBuilder<CatsFactBlocs, CatsFactState>(
        builder: (BuildContext context, state) {
          if (!state.didFactLoading) {
            return ElevatedButton(
                onPressed: () => context.catFactsBloc.add(LoadCatFactEvent()),
                child: Text(state.error.isNotEmpty
                    ? RELOAD_CAT_FACT
                    : LOAD_NEXT_FRACT));
          } else {
            return Container();
          }
        },
      );
}
