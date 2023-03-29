

import 'package:flutter/material.dart';

import '../../../../config/constaints/ui_constaints.dart';

enum CatsFactsPages{
  RANDOM_FACTS, HISTORY
}

extension FactsPages on CatsFactsPages{

  String get pageTitle {
    switch (this) {
      case CatsFactsPages.RANDOM_FACTS:
        return RANDOM_FACTS_PAGE_TITLE;
      case CatsFactsPages.HISTORY:
        return HISTORY_FACTS_PAGE_TITLE;
    }
  }

  IconData get icon{
    switch(this){
      case CatsFactsPages.RANDOM_FACTS:
        return Icons.message;
      case CatsFactsPages.HISTORY:
        return Icons.history;
    }
  }


}