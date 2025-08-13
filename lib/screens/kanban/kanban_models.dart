// lib/screens/kanban/kanban_models.dart
import 'package:flutter/material.dart';

class Stage {
  final String id;
  String title;
  Stage({required this.id, required this.title});
}

class Deal {
  final String id;
  String title;
  double amount;
  String company;
  String owner;
  Color color;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? closeDate;
  String assignedTo;

  Deal({
    required this.id,
    required this.title,
    required this.amount,
    required this.company,
    required this.owner,
    required this.color,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.closeDate,
    String? assignedTo,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now(),
       assignedTo = assignedTo ?? owner;
}

class PipelineDetailsArgs {
  final String pipelineName;
  final String currentStageId;
  final List<Stage> stages;
  final Deal deal;
  const PipelineDetailsArgs({
    required this.pipelineName,
    required this.currentStageId,
    required this.stages,
    required this.deal,
  });
}
