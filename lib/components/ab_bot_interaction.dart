import 'package:aubilous/components/ab_bot_select.dart';
import 'package:aubilous/components/ab_bot_sent_message.dart';
import 'package:aubilous/core/models/bot_interaction_model.dart';
import 'package:aubilous/resourses/app_colors.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class AbBotReceivedMessage extends StatelessWidget {
  final bool isManager;
  final String message;
  final bool showTitle;
  const AbBotReceivedMessage(this.message, {required this.showTitle, this.isManager = false, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.s01_5),
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: constraints.maxWidth * .9),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.s04,
                  vertical: AppSizes.s03,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppSizes.s05),
                    bottomLeft: Radius.circular(AppSizes.s05),
                    bottomRight: Radius.circular(AppSizes.s05),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showTitle)
                      Text(
                        "Aubot",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isManager ? AppColors.accent : AppColors.primary,
                        ),
                      ),
                    Text(
                      message,
                      style: TextStyle(color: Colors.grey.shade700, height: 1.2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AbBotInteraction extends StatelessWidget {
  final BotInteractionModel interaction;
  final void Function(String value) onAnswer;
  const AbBotInteraction(this.interaction, {required this.onAnswer, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...interaction.messages.mapIndexed(
          (i, e) => AbBotReceivedMessage(e, showTitle: i == 0),
        ),
        if (interaction.options.isNotEmpty)
          AbBotSelect(
            value: interaction.response,
            options: interaction.options,
            onSelect: onAnswer,
          )
        else if (interaction.type == BotInteractionType.text && interaction.response.isNotEmpty)
          AbBotSentMessage(interaction.response)
      ],
    );
  }
}
