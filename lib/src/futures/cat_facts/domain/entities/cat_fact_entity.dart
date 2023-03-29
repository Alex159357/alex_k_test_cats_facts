

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CatFactEntity extends Equatable{
  final String id;
  final String? user;
  final String text;
  final int v;
  final String? source;
  final DateTime updatedAt;
  final String? type;
  final DateTime createdAt;
  final bool? deleted;
  final bool? used;


  const CatFactEntity(
      {required this.id,
      required this.user,
      required this.text,
      required this.v,
      required this.source,
      required this.updatedAt,
      required this.type,
      required this.createdAt,
      required this.deleted,
      required this.used});

  @override
  List<Object?> get props => [id, user, text, v, source, updatedAt, type, createdAt, deleted, used];
}