import 'package:aubilous/core/models/bot_interaction_model.dart';
import 'package:aubilous/core/models/bot_start_model.dart';
import 'package:dio/dio.dart';

class TypebotService {
  final String _botId;
  late final Dio _client;

  TypebotService(this._botId) {
    _client = Dio(
      BaseOptions(
        baseUrl: 'https://typebot.io/api/v2',
        headers: {"Authorization": "Bearer ast5kGfojhZKz3suXZJj5cXT"},
      ),
    );
  }

  Future<BotStartModel> startConversation() async {
    var resp = await _client.post(
      "/sendMessage",
      data: {
        "startParams": {
          "typebot": _botId,
          "isPreview": true,
        },
      },
    );

    var interaction = BotInteractionModel.fromTypebotResponse(resp.data);
    return BotStartModel(
      sessionId: resp.data['sessionId'].toString(),
      initialInteraction: interaction,
    );
  }

  Future<BotInteractionModel> answer({required String message, required String sessionId}) async {
    var resp = await _client.post(
      "/sendMessage",
      data: {
        "message": message,
        "sessionId": sessionId,
      },
    );

    return BotInteractionModel.fromTypebotResponse(resp.data);
  }
}
