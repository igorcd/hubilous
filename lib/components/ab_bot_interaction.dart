import 'package:aubilous/components/ab_appear_animation.dart';
import 'package:aubilous/components/ab_bot_embed_message.dart';
import 'package:aubilous/components/ab_bot_received_message.dart';
import 'package:aubilous/components/ab_bot_select.dart';
import 'package:aubilous/components/ab_bot_sent_message.dart';
import 'package:aubilous/core/models/bot_interaction_model.dart';
import 'package:aubilous/core/models/bot_message_model.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class AbBotInteraction extends StatelessWidget {
  final BotInteractionModel interaction;
  final void Function(String value) onAnswer;
  const AbBotInteraction(this.interaction, {required this.onAnswer, super.key});

  @override
  Widget build(BuildContext context) {
    return AbAppearAnimation(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...interaction.messages.mapIndexed((i, e) {
            if (e is BotEmbedMessageModel) {
              return AbBotEmbedMessage(
                link: e.url,
              );
            }

            if (e is BotTextMessageModel) {
              return AbBotReceivedMessage(e.text, showTitle: i == 0);
            }

            return const Text("NOT MAPPED");
          }),
          if (interaction.options.isNotEmpty)
            AbBotSelect(
              value: interaction.response,
              options: interaction.options,
              onSelect: onAnswer,
            )
          else if (interaction.type == BotInteractionType.text && interaction.response.isNotEmpty)
            AbBotSentMessage(interaction.response)
        ],
      ),
    );
  }
}
