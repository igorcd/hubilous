import 'dart:async';

import 'package:aubilous/components/ab_bot_input.dart';
import 'package:aubilous/components/ab_bot_interaction.dart';
import 'package:aubilous/core/models/bot_interaction_model.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/services/typebot_service.dart';
import 'package:flutter/material.dart';

class AbBot extends StatefulWidget {
  final String botId;
  const AbBot(this.botId, {super.key});

  @override
  State<AbBot> createState() => _AbBotState();
}

class _AbBotState extends State<AbBot> {
  late TypebotService _typebotService;
  TextEditingController textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<BotInteractionModel> interactions = [];
  String sessionId = '';
  bool loading = false;

  void _scrollToEnd() {
    Timer(const Duration(milliseconds: 500), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  void sendMessage([String? value]) async {
    var answer = value ?? textController.text;
    try {
      setState(() {
        interactions.last.response = answer;
        textController.clear();
        loading = true;
      });

      _scrollToEnd();

      var resp = await _typebotService.answer(message: answer, sessionId: sessionId);
      setState(() {
        interactions.add(resp);
      });

      _scrollToEnd();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Houston, we had a problem, try again later"),
        ));
      }
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void startConversation() async {
    try {
      var resp = await _typebotService.startConversation();
      setState(() {
        interactions.add(resp.initialInteraction);
        sessionId = resp.sessionId;
      });

      _scrollToEnd();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Houston, we had a problem, try again later"),
        ));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _typebotService = TypebotService(widget.botId);
    startConversation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.s06,
              vertical: AppSizes.s03,
            ),
            itemCount: interactions.length,
            separatorBuilder: (c, i) => const SizedBox(height: AppSizes.s02),
            itemBuilder: (c, i) => AbBotInteraction(interactions[i], onAnswer: sendMessage),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSizes.s06),
          child: SafeArea(
            top: false,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              switchInCurve: Curves.ease,
              switchOutCurve: Curves.ease,
              child: interactions.isNotEmpty && interactions.last.type == BotInteractionType.text
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          child: !loading
                              ? const SizedBox.shrink()
                              : const Padding(
                                  padding: EdgeInsets.only(bottom: AppSizes.s02),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Aubot is typing...",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        AbBotInput(
                          controller: textController,
                          onSubmit: sendMessage,
                        )
                      ],
                    )
                  : const SizedBox(
                      height: AppSizes.s12,
                    ),
            ),
          ),
        )
      ],
    );
  }
}
