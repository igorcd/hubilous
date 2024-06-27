import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AbBotEmbedMessage extends StatefulWidget {
  final String link;
  const AbBotEmbedMessage({required this.link, super.key});

  @override
  State<AbBotEmbedMessage> createState() => _AbBotEmbedMessageState();
}

class _AbBotEmbedMessageState extends State<AbBotEmbedMessage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.endsWith("/view")) {
              launchUrlString(request.url, mode: LaunchMode.externalApplication);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: AppSizes.s01_5),
          width: 250,
          padding: const EdgeInsets.all(AppSizes.s02),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppSizes.s05),
              bottomLeft: Radius.circular(AppSizes.s05),
              bottomRight: Radius.circular(AppSizes.s05),
            ),
          ),
          child: AspectRatio(
            aspectRatio: 210 / 289,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.s03),
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
