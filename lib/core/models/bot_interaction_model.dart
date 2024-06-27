import 'package:aubilous/core/models/bot_message_model.dart';

enum BotInteractionType {
  choice,
  text,
}

class BotInteractionModel {
  final List<BotMessageModel> messages;
  final List<String> options;
  final BotInteractionType type;
  String response;

  BotInteractionModel({
    required this.messages,
    required this.type,
    required this.response,
    required this.options,
  });

  factory BotInteractionModel.fromTypebotResponse(Map<String, dynamic> map) {
    List<String> options = map['input'] != null
        ? List.from(map['input']['items'] ?? [])
            .map((item) => item['content'].toString()) //
            .toList()
        : [];

    return BotInteractionModel(
      messages: List.from(map['messages'])
          .map(
            (message) => BotMessageModel.fromMap(message),
          )
          .toList(),
      type: map['input']['type'] == 'text input' ? BotInteractionType.text : BotInteractionType.choice,
      options: options,
      response: "",
    );
  }
}
