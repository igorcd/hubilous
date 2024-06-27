enum BotInteractionMessageType {
  text,
  embed,
}

///
/// Bot Text Message
///
class BotTextMessageModel extends BotMessageModel {
  final String text;

  BotTextMessageModel({required this.text}) : super(type: BotInteractionMessageType.text);
}

///
/// Bot Embed Message
///
class BotEmbedMessageModel extends BotMessageModel {
  final String url;

  BotEmbedMessageModel({required this.url}) : super(type: BotInteractionMessageType.embed);
}

///
/// Bot Message
///
class BotMessageModel {
  final BotInteractionMessageType type;

  BotMessageModel({required this.type});

  static String mapMessageChild(Map<String, dynamic> richText) {
    return List.from(richText['children']).map((child) {
      if (child['text'] != null) {
        return child['text'];
      }

      if (child['children'] != null) {
        return mapMessageChild(child);
      }

      return '';
    }).join('\n');
  }

  factory BotMessageModel.fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'embed') {
      return BotEmbedMessageModel(url: map['content']['url']);
    }

    var messages = List.from(map['content']['richText']).map((richText) => mapMessageChild(richText)).join("\n");

    return BotTextMessageModel(text: messages);
  }
}
