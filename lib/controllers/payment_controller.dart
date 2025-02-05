import 'package:event_planner_light/model/PackagesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:myfatoorah_flutter/MFModels.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

class PaymentController extends GetxController {
  List<MFPaymentMethod> paymentMethods = <MFPaymentMethod>[].obs;
  Rx<PackagesModel> packagesModel = PackagesModel().obs;
  // RxDouble finalAmount = 0.0.obs;
  RxList<bool> isSelectedList = <bool>[].obs;
  bool isPaymentMethodselected = false;
  int selectedPaymentMethodIndex = -1;
  bool visibilityObs = false;
  RxBool isloading = false.obs;
  RxBool termsAndConditionAccepted = false.obs;
  RxString responseMessage = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    initiate();
  }

  initiate() async {
    isloading.value = true;
    // TODO, don't forget to init the MyFatoorah Plugin with the following line
    await MFSDK.init(
        'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL',
        MFCountry.KUWAIT,
        MFEnvironment.TEST);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initiatePayment();
      // await initiateSession();
      isloading.value = false;
    });
  }

  initiatePayment() async {
    var request = MFInitiatePaymentRequest(
        invoiceAmount: packagesModel.value.price,
        currencyIso: MFCurrencyISO.KUWAIT_KWD);

    await MFSDK
        .initiatePayment(request, MFLanguage.ENGLISH)
        .then((value) => {
              print(value),
              paymentMethods.addAll(value.paymentMethods!),
              for (int i = 0; i < paymentMethods.length; i++)
                isSelectedList.add(false)
            })
        .catchError((error) => {print(error.message)});
  }

  setPaymentMethodSelected(int index, bool value) {
    isPaymentMethodselected = value;
    for (int i = 0; i < isSelectedList.length; i++) {
      if (i == index) {
        isSelectedList[i] = value;
        if (value) {
          selectedPaymentMethodIndex = index;
          visibilityObs = paymentMethods[index].isDirectPayment!;
        } else {
          selectedPaymentMethodIndex = -1;
          visibilityObs = false;
        }
      } else {
        isSelectedList[i] = false;
      }
    }
  }

  executePayment() {
    if (selectedPaymentMethodIndex == -1) {
      responseMessage.value = "Please select payment method first";
    } else {
      if (packagesModel.value.price == 0) {
        responseMessage.value = "Set the amount";
      } else {
        executeRegularPayment(
            paymentMethods[selectedPaymentMethodIndex].paymentMethodId!);
      }
    }
  }

  executeRegularPayment(int paymentMethodId) async {
    var request = MFExecutePaymentRequest(
        userDefinedField: packagesModel.toString(),
        paymentMethodId: paymentMethodId,
        invoiceValue: packagesModel.value.price);
    request.displayCurrencyIso = MFCurrencyISO.KUWAIT_KWD;

    // var recurring = MFRecurringModel();
    // recurring.intervalDays = 10;
    // recurring.recurringType = MFRecurringType.Custom;
    // recurring.iteration = 2;
    // request.recurringModel = recurring;

    await MFSDK
        .executePayment(request, MFLanguage.ENGLISH, (invoiceId) {
          print(invoiceId);
        })
        .then((value) => print(value))
        .catchError((error) => {print(error.message)});
  }

}
