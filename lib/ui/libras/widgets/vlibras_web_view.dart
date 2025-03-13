import 'package:app/ui/libras/view_model/libras_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VLibrasWebView extends StatefulWidget {
  const VLibrasWebView({super.key});

  @override
  State<VLibrasWebView> createState() => _VLibrasWebViewState();
}

class _VLibrasWebViewState extends State<VLibrasWebView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LibrasViewModel>(
      builder: (context, viewModel, child) {
        return WebViewWidget(controller: viewModel.webViewController);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<LibrasViewModel>().setWebViewConfig();
  }
}
