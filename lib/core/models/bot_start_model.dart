import 'package:aubilous/core/models/bot_interaction_model.dart';

class BotStartModel {
  final String sessionId;
  final BotInteractionModel initialInteraction;

  BotStartModel({required this.sessionId, required this.initialInteraction});
}
