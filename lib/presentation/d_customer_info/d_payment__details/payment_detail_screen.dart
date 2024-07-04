import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_management/user_data_cubit.dart';
import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/core/utils/global_key_constant.dart';
import 'package:castle_couture/presentation/d_customer_info/d_payment__details/cubit/cubit/form_validation_cubit/payment_form_cubit.dart';
import 'package:castle_couture/presentation/d_customer_info/d_payment__details/cubit/cubit/form_validation_cubit/payment_form_state.dart';
import 'package:castle_couture/presentation/d_customer_info/e_date_time/date_time_screen.dart';
import 'package:castle_couture/widgets/validator_regex/payment_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({super.key});

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  final TextEditingController _yearController = TextEditingController();
  late String creditCardDescription;
  bool _isloadingpage = true;
  bool isCheckBoxChecked = false;
  // RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();

  String verifyResult = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<PaymentFormCubit, PaymentFormState>(
      builder: (context, state) {
        final cubit = context.read<PaymentFormCubit>();
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Add payment details',
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: CastleKeys.castleKey5,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.headline(
                      text: 'Credit card information',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.name,
                        placeholder: 'Name on card',
                        hintText: 'Card holder name',
                        maxLines: 1,
                        onChanged: (value) {
                          cubit.onChangedCardHolderName(value);
                          context
                              .read<UserDataCubit>()
                              .updateUserData('cardname', value);
                        },
                        validator: (value) =>
                            CreditCardValidator.cardHolderNameValidator(value)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.number,
                        placeholder: 'Card number',
                        hintText: 'XXXX XXXX XXXX',
                        maxLines: 1,
                        maxLength: 16,
                        onChanged: (value) {
                          cubit.onChangedCardNumber(value);
                          context
                              .read<UserDataCubit>()
                              .updateUserData('cardnumber', value);
                        },
                        validator: (value) =>
                            CreditCardValidator.cardNumberValidator(value)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                width: size.width * 0.44,
                                keyboardType: TextInputType.datetime,
                                placeholder: 'Expiry Month',
                                hintText: 'mm',
                                maxLines: 1,
                                maxLength: 2,
                                onChanged: (value) {
                                  cubit.onChangedExpiryMonth(value);
                                  context
                                      .read<UserDataCubit>()
                                      .updateUserData('expirymonth', value);
                                },
                                validator: (value) =>
                                    CreditCardValidator.expiryMonthValidator(
                                        value, _yearController.text),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                controller: _yearController,
                                width: size.width * 0.44,
                                keyboardType: TextInputType.datetime,
                                placeholder: 'Expiry year',
                                hintText: 'yyyy',
                                maxLines: 1,
                                maxLength: 4,
                                onChanged: (value) {
                                  cubit.onChangedExpiryYear(value);
                                  context
                                      .read<UserDataCubit>()
                                      .updateUserData('expireyear', value);
                                },
                                validator: (value) =>
                                    CreditCardValidator.expiryYearValidator(
                                        value),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.number,
                        placeholder: 'CVV',
                        hintText: 'XXX',
                        maxLines: 1,
                        maxLength: 3,
                        onChanged: (value) {
                          cubit.onChangedCvv(value);
                          context
                              .read<UserDataCubit>()
                              .updateUserData('cvv', value);
                        },
                        validator: (value) =>
                            CreditCardValidator.cvvValidator(value)),
                    const SizedBox(height: 10),
                    CheckboxListTile(
                        activeColor: CustomColors.primaryStroke,
                        checkColor: Colors.white,
                        side: const BorderSide(color: CustomColors.liteBlack),
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: -6),
                        title: CustomText.spanText(
                            text: 'Appointment Deposit & cancellation'
                                .toUpperCase(),
                            textAlign: TextAlign.start),
                        value: isCheckBoxChecked,
                        onChanged: (value) {
                          setState(() {
                            isCheckBoxChecked = value!;
                          });
                        }),
                    _isloadingpage
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ExpansionTile(
                            expandedAlignment: Alignment.bottomCenter,
                            tilePadding: EdgeInsets.zero,
                            //  collapsedShape:  Border.all(width: 0 ),
                            shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.zero,
                            ),
                            trailing: const SizedBox(),
                            title: Html(data: creditCardDescription),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    // RecaptchaV2(
                    //   apiKey: "6LdmosQpAAAAAACbw95jQBVak1flbdUfgREiiW0W",
                    //   apiSecret: "6LdmosQpAAAAAMK10dJw0KYHFAGHZz5p7VLAWO6H",
                    //   controller: recaptchaV2Controller,
                    //   onVerifiedError: (err) {
                    //     print("Error verifying reCAPTCHA: $err");
                    //   },
                    //   onVerifiedSuccessfully: (success) {
                    //     setState(() {
                    //       if (success) {
                    //         _isrecaptchaverified = true;
                    //         verifyResult = "You've been verified successfully.";
                    //       } else {
                    //         print("google it");
                    //         verifyResult = "Failed to verify.";
                    //       }
                    //     });
                    //   },
                    // ),

                    // const SizedBox(height: 24),
                    // ElevatedButton(
                    //   child: Text("Reload ReCAPTCHA"),
                    //   onPressed: () =>
                    //      recaptchaV2Controller.reload(), // <-- Add parentheses to call the function
                    // ),

                    Stack(
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: size.height * 0.062,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: (isCheckBoxChecked)//state.isFormValid
                                    ? CustomButton(
                                        onTap: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const DateTimeScreen(),
                                            ),
                                          );
                                        },
                                        text: 'Next',
                                      )
                                    : const InactiveButton(text: 'Next')),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

//   String _token = 'Click the below button to generate token';
//   bool badgeVisible = true;
//   // Platform messages are asynchronous, so we initialize in an async method.
// Future<void> getToken() async {
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     bool ready = await GRecaptchaV3.ready("6LdmosQpAAAAAACbw95jQBVak1flbdUfgREiiW0W");
//     print("Is Recaptcha ready? $ready");

//     if (ready) {
//       String token = await GRecaptchaV3.execute('submit') ?? 'null returned';
//       setState(() {
//         _token = token;
//       });
//     } else {
//       print("reCaptcha is not ready yet.");
//     }
//   } catch (e) {
//     print('Error generating reCaptcha token: $e');
//   }
// }

  Future<void> fetchCreditCardDescription() async {
    try {
      String description = await ApiService.fetchCreditCardDescription();
      setState(() {
        creditCardDescription = description;
        _isloadingpage = false;
      });
    } catch (e) {
      print('Error loading states list: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCreditCardDescription();
  }
}
