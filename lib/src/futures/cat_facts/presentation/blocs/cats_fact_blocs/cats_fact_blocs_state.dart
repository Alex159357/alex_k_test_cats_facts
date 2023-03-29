import 'package:flutter/cupertino.dart';

import '../../../domain/entities/cat_fact_entity.dart';

class CatsFactState {
  final CatFactEntity? catFactEntity;
  final bool didFactLoading;
  final String error;
  final String imageUrl;
  final List<CatFactEntity> catsHistoryList;

  CatsFactState(
      {this.catFactEntity,
      this.didFactLoading = false,
      this.error = "",
      this.imageUrl = "",
      this.catsHistoryList = const []});

  CatsFactState clone(
          {CatFactEntity? catFactEntity,
          bool? didFactLoading,
          String? error,
          String? imageUrl,
          List<CatFactEntity>? catsHistoryList}) =>
      CatsFactState(
          catFactEntity: catFactEntity ?? this.catFactEntity,
          didFactLoading: didFactLoading ?? this.didFactLoading,
          error: error ?? this.error,
          imageUrl: imageUrl ?? this.imageUrl,
          catsHistoryList: catsHistoryList ?? this.catsHistoryList);
}
