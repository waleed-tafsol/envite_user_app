// import 'dart:convert';

// import 'package:event_planner_light/controllers/Auth_services.dart';
// import 'package:event_planner_light/model/PackagesModel.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
// import 'package:http/http.dart' as http;
// import '../constants/ApiConstant.dart';
// import '../utills/CustomSnackbar.dart';

// class PaymentController extends GetxController {
//   List<MFPaymentMethod> paymentMethods = <MFPaymentMethod>[].obs;
//   PackagesModel? packagesModel;
//   // RxDouble finalAmount = 0.0.obs;
//   RxList<bool> isSelectedList = <bool>[].obs;
//   bool isPaymentMethodselected = false;
//   int selectedPaymentMethodIndex = -1;
//   bool visibilityObs = false;
//   RxBool isloading = false.obs;
//   RxBool termsAndConditionAccepted = false.obs;
//   bool isTopUpPayment = false;
//   RxBool isPaymentLoading = false.obs;
//   RxString responseMessage = ''.obs;
//   int noOfInvites = 0;
//   late String routeToPopTill;

//   @override
//   void onInit() async {
//     initiate();
//     if (Get.arguments != null) {
//       isTopUpPayment = Get.arguments["istopupPayment"];
//       packagesModel = Get.arguments["packagesModel"];
//       noOfInvites = Get.arguments["noOfInvites"];
//       routeToPopTill = Get.arguments["routeToPopTill"];
//     }
//     initiate();
//     super.onInit();
//   }

//   initiate() async {
//     isloading.value = true;
//     await MFSDK.init(
//         'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL',
//         MFCountry.UAE,
//         MFEnvironment.TEST);
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await initiatePayment();
//       // await initiateSession();
//       isloading.value = false;
//     });
//   }

//   initiatePayment() async {
//     var request = MFInitiatePaymentRequest(
//         invoiceAmount: isTopUpPayment
//             ? packagesModel!.price! * noOfInvites
//             : packagesModel?.price,
//         currencyIso: MFCurrencyISO.UNITEDSTATES_USD);

//     await MFSDK
//         .initiatePayment(request, MFLanguage.ENGLISH)
//         .then((value) => {
//               paymentMethods.addAll(value.paymentMethods!),
//               for (int i = 0; i < paymentMethods.length; i++)
//                 isSelectedList.add(false)
//             })
//         .catchError((error) => {print(error.message)});
//   }

//   setPaymentMethodSelected(int index, bool value) {
//     isPaymentMethodselected = value;
//     for (int i = 0; i < isSelectedList.length; i++) {
//       if (i == index) {
//         isSelectedList[i] = value;
//         if (value) {
//           selectedPaymentMethodIndex = index;
//           visibilityObs = paymentMethods[index].isDirectPayment!;
//         } else {
//           selectedPaymentMethodIndex = -1;
//           visibilityObs = false;
//         }
//       } else {
//         isSelectedList[i] = false;
//       }
//     }
//   }

//   executePayment() async {
//     // Start the payment loading process
//     if (!isPaymentLoading.value) {
//       isPaymentLoading.value = true;

//       // Check if the terms and conditions are accepted
//       if (!termsAndConditionAccepted.value) {
//         CustomSnackbar.showError("Error", "Please accept terms and conditions");
//         isPaymentLoading.value = false;
//         return;
//       }

//       // Check if a payment method is selected
//       if (!isPaymentMethodselected) {
//         CustomSnackbar.showError("Error", "Please Select Payment Method");
//         isPaymentLoading.value = false;
//         return;
//       }

//       // If payment method is selected and loading is not in progress, proceed with payment

//       // Check if a valid payment method is selected
//       if (selectedPaymentMethodIndex == -1) {
//         responseMessage.value = "Please select payment method first";
//         isPaymentLoading.value = false;
//         return;
//       }

//       // Check if price is set
//       if (packagesModel?.price == 0) {
//         responseMessage.value = "Set the amount";
//         isPaymentLoading.value = false;
//         return;
//       }

//       // Proceed with the regular payment
//       await executeRegularPayment(
//           paymentMethods[selectedPaymentMethodIndex].paymentMethodId!);

//       // Reset loading state after the payment process
//       isPaymentLoading.value = false;
//     }
//   }

//   Future<void> executeRegularPayment(int paymentMethodId) async {
//     var request = MFExecutePaymentRequest(
//         customerEmail: authService.me.value?.email,
//         userDefinedField: packagesModel.toString(),
//         paymentMethodId: paymentMethodId,
//         invoiceValue: packagesModel?.price);
//     request.displayCurrencyIso = MFCurrencyISO.UNITEDSTATES_USD;

//     // var recurring = MFRecurringModel();
//     // recurring.intervalDays = 10;
//     // recurring.recurringType = MFRecurringType.Custom;
//     // recurring.iteration = 2;
//     // request.recurringModel = recurring;

//     await MFSDK
//         .executePayment(request, MFLanguage.ENGLISH, (invoiceId) {})
//         .then((value) => paymentConfirmed(
//             numOfInvites: noOfInvites,
//             invoiceId: value.invoiceId.toString(),
//             pmId: paymentMethodId))
//         .catchError((error) {
//       CustomSnackbar.showError("Error", error.message);
//     });
//   }

//   paymentConfirmed(
//       {required String invoiceId,
//       required int numOfInvites,
//       required int pmId}) async {
//     try {
//       Get.dialog(Center(child: CircularProgressIndicator()),
//           barrierDismissible: false);
//       final response = await http.patch(
//           Uri.parse(ApiConstants.buyPackages + packagesModel!.slug!),
//           body: jsonEncode({
//             "noOfInvites": numOfInvites,
//             "pmId": pmId,
//             "invoiceId": invoiceId
//           }),
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${authService.authToken}',
//           });
//       if (response.statusCode == 200) {
//         await authService.getMe();
//         isloading.value = false;
//         CustomSnackbar.showSuccess("Successful", "payment was successful");
//         Get.until((route) => route.settings.name == routeToPopTill);
//       } else {
//         isloading.value = false;
//         final jsonResponse = jsonDecode(response.body);
//         throw Exception(jsonResponse["message"]["error"][0] ??
//             "SomeThing Went Wrong Payment was not successful");
//       }
//     } catch (e) {
//       Get.back();
//       isloading.value = false;
//       CustomSnackbar.showError('Error', e.toString());
//     }
//   }
// }
