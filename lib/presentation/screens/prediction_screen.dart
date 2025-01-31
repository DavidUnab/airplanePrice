import 'package:airplane_price/config/constants/color_constants.dart';
import 'package:airplane_price/config/constants/enums/airplane_models_enum.dart';
import 'package:airplane_price/config/constants/style_contants.dart';
import 'package:airplane_price/config/parameters/parameters.dart';
import 'package:airplane_price/infrastructure/models/request/airplane_prediction_request.dart';
import 'package:airplane_price/presentation/providers/predicted_price_provider.dart';
import 'package:airplane_price/presentation/providers/state/predicted_price_state.dart';
import 'package:airplane_price/presentation/usecase/prediction_usecase.dart';
import 'package:airplane_price/presentation/widgets/custom_button.dart';
import 'package:airplane_price/presentation/widgets/custom_dialog.dart';
import 'package:airplane_price/presentation/widgets/custom_dropdown.dart';
import 'package:airplane_price/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class PredictionScreen extends ConsumerStatefulWidget {
  const PredictionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PredictionScreenState();
}

class _PredictionScreenState extends ConsumerState<PredictionScreen> {
  final TextEditingController modelController = TextEditingController();
  final TextEditingController numEnginesController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final ValueNotifier<bool> enabledButton = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isNumEnginesError = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isCapacityError = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isAgeError = ValueNotifier<bool>(false);
  final ValueNotifier<bool> showFloat = ValueNotifier<bool>(false);
  late PredictionUseCase _predictionUseCase;

  @override
  void initState() {
    modelController.addListener(_checkInput);
    numEnginesController.addListener(_checkInput);
    capacityController.addListener(_checkInput);
    ageController.addListener(_checkInput);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _predictionUseCase = PredictionUseCase(ref: ref);
    });
    super.initState();
  }

  void _checkInput() {
    final isModelNotEmpty = modelController.text.isNotEmpty;
    final isNumEnginesNotEmpty = numEnginesController.text.isNotEmpty;
    final isCapacityNotEmpty = capacityController.text.isNotEmpty;
    final isaGENotEmpty = ageController.text.isNotEmpty;
    enabledButton.value = isModelNotEmpty &&
        isNumEnginesNotEmpty &&
        isCapacityNotEmpty &&
        isaGENotEmpty &&
        !isNumEnginesError.value &&
        !isCapacityError.value &&
        !isAgeError.value;
  }

  @override
  Widget build(BuildContext context) {
    final PredictedPriceState predictedPrice =
        ref.watch(predictedPriceProvider);

    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          ref.read(predictedPriceProvider.notifier).setPrice("");
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Parameters.predictionTitle,
            style: StyleConstants.configTitleTextStyle,
          ),
          backgroundColor: ColorConstants.backgroundAppBar,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        backgroundColor: ColorConstants.background,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomDropdown(
                    items: AirplaneModelsEnum.getDescriptions(),
                    labelText: Parameters.predictionModelTitle,
                    hintText: Parameters.predictionModelHint,
                    onSelectedItem: (String value) {
                      int modelId =
                          AirplaneModelsEnum.getIdByDescription(value) ?? 0;
                      modelController.text = modelId.toString();
                      _checkInput();
                    },
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: numEnginesController,
                    labelText: Parameters.predictionNumEnginesTitle,
                    keyboardType: TextInputType.number,
                    minValue: Parameters.minValueNumEngines,
                    maxValue: Parameters.maxValueNumEngines,
                    helperText: Parameters.descriptionRangeNumEngines,
                    onError: (value) {
                      isNumEnginesError.value = value;
                      _checkInput();
                    },
                    onChanged: (value) => _checkInput(),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: capacityController,
                    labelText: Parameters.predictionCapacityTitle,
                    keyboardType: TextInputType.number,
                    minValue: Parameters.minValueCapacity,
                    maxValue: Parameters.maxValueCapacity,
                    helperText: Parameters.descriptionCapacity,
                    onError: (value) {
                      isCapacityError.value = value;
                      _checkInput();
                    },
                    onChanged: (value) => _checkInput(),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: ageController,
                    labelText: Parameters.predictionAgeTitle,
                    keyboardType: TextInputType.number,
                    minValue: Parameters.minValueAge,
                    maxValue: Parameters.maxValueAge,
                    helperText: Parameters.descriptionAge,
                    onError: (value) {
                      isAgeError.value = value;
                      _checkInput();
                    },
                    onChanged: (value) => _checkInput(),
                  ),
                  const SizedBox(height: 40),
                  ValueListenableBuilder(
                    valueListenable: enabledButton,
                    builder: (context, enable, child) {
                      return CustomMainButton(
                        text: Parameters.predictionTitle,
                        enabled: enable,
                        onPressed: () async {
                          await _predictionUseCase
                              .validateApiRest(getRequest());
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  (predictedPrice.showLoading)
                      ? Center(
                          child: Lottie.asset(
                            'assets/lottie/loading.json',
                            width: 200,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 20),
                  (predictedPrice.predictedPrice.isNotEmpty)
                      ? CustomFloatingWidget(
                          title: Parameters.predictResult,
                          description: predictedPrice.predictedPrice,
                          onClosePressed: () => ref
                              .read(predictedPriceProvider.notifier)
                              .setPrice(Parameters.empty),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AirplanePredictionRequest getRequest() {
    return AirplanePredictionRequest(
      model: int.parse(modelController.text),
      numEngines: int.parse(numEnginesController.text),
      capacity: int.parse(capacityController.text),
      age: int.parse(ageController.text),
    );
  }
}
