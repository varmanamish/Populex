import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'package:webview_flutter/webview_flutter.dart';
// For Android, iOS, and web:
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class LegalDocAssistantScreen extends StatefulWidget {
  @override
  _LegalDocAssistantScreenState createState() =>
      _LegalDocAssistantScreenState();
}

class _LegalDocAssistantScreenState extends State<LegalDocAssistantScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Platform specific initialization
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    // Configure the controller
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      );

    _controller = controller;
    _loadHtmlFromAssets();
  }

  Future<void> _loadHtmlFromAssets() async {
    try {
      final String html = await rootBundle.loadString('assets/index.html');
      await _controller.loadHtmlString(html);
    } catch (e) {
      debugPrint('Error loading HTML: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LegalDoc Assistant')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
