enum BotInteractionType {
  choice,
  text,
}

class BotInteractionModel {
  final List<String> messages;
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
    List<dynamic> messages = List.from(map['messages']) //
        .map((message) => List.from(message['content']['richText'])
            .expand((element) => element['children'])
            .map((child) => child['text'])
            .join('\n'))
        .toList();

    List<String> options = List.from(map['input']['items'] ?? [])
        .map((item) => item['content'].toString()) //
        .toList();

    return BotInteractionModel(
      messages: List<String>.from(messages),
      type: map['input']['type'] == 'text input' ? BotInteractionType.text : BotInteractionType.choice,
      options: options,
      response: "",
    );
  }
}
