import 'package:airplane_price/config/constants/color_constants.dart';
import 'package:airplane_price/config/constants/style_contants.dart';
import 'package:airplane_price/config/parameters/parameters.dart';
import 'package:airplane_price/presentation/providers/api_url_provider.dart';
import 'package:airplane_price/presentation/screens/prediction_screen.dart';
import 'package:airplane_price/presentation/widgets/custom_button.dart';
import 'package:airplane_price/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigScreen extends ConsumerStatefulWidget {
  const ConfigScreen({super.key});

  @override
  ConsumerState<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends ConsumerState<ConfigScreen> {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final ValueNotifier<bool> enabledButton = ValueNotifier<bool>(false);

  @override
  void initState() {
    ipController.addListener(_checkInput);
    portController.addListener(_checkInput);
    super.initState();
  }

  void _checkInput() {
    final isIpNotEmpty = ipController.text.isNotEmpty;
    final isPortNotEmpty = portController.text.isNotEmpty;
    enabledButton.value = isIpNotEmpty && isPortNotEmpty;
  }

  @override
  void dispose() {
    ipController.dispose();
    portController.dispose();
    enabledButton.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Parameters.configTitle,
          style: StyleConstants.configTitleTextStyle,
        ),
        backgroundColor: ColorConstants.backgroundAppBar,
      ),
      backgroundColor: ColorConstants.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              CustomTextField(
                controller: ipController,
                labelText: Parameters.configIpServer,
                keyboardType: TextInputType.number,
                regExp: RegExp(r'[0-9.]'),
                onError: (value) {},
                onChanged: (value) {},
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: portController,
                labelText: Parameters.configPortServer,
                keyboardType: TextInputType.number,
                onError: (value) {},
                onChanged: (value) {},
              ),
              const SizedBox(height: 60),
              ValueListenableBuilder(
                valueListenable: enabledButton,
                builder: (context, enable, child) {
                  return CustomMainButton(
                    text: Parameters.saveTitleButton,
                    enabled: enable,
                    onPressed: () async {
                      await validateNavigate();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  validateNavigate() {
    String ip = ipController.text;
    String port = portController.text;
    if (ip.isNotEmpty || port.isNotEmpty) {
      String newUrl = "http://$ip:$port";
      ref.read(apiUrlProvider.notifier).updateUrl(newUrl);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PredictionScreen()),
      );
    } else {}
  }
}
