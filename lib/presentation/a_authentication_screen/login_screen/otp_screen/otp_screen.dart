import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/a_authentication_screen/login_screen/otp_screen/cubit/otp_cubit.dart';
import 'package:castle_couture/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../widgets/custom_buttons/custom_text_btn.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    //    height: ScaleSize.height(22),
                    //  height: ScaleSize.height(100),
                    // height: MediaQuery.of(context).size.height,
                    // padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
                    //  width: ScaleSize.width(100),
                    // color: CustomColors.backgroundColor,
                    //color: Colors.red,
                    child: CustomImageView(
                        height: size.height * 0.20,
                        width: size.width * 0.60,
                        imagePath: ImageConstant.primaryLogo,
                        fit: BoxFit.contain),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    /*    width: ScaleSize.width(100),
                    padding: ScaleSize.paddingSymmetric(
                        horizontal: 4.2, vertical: 2.0),*/

                    decoration: BoxDecoration(
                      // color: backgroundColor ?? Colors.transparent,
                      //  color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: BlocBuilder<OtpCubit, OtpState>(
                      builder: (context, state) {
                        final otpCubit = context.watch<OtpCubit>();
                        return Column(
                          children: [
                            CustomText.headline(text: 'Welcome'),
                            CustomText.spanText(
                                text: 'Please enter the otp sent to'),
                            /* const SizedBox(
                          height: 20,
                        ),*/
                            CustomText.contentText(text: '//number'),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: double.infinity,
                                child: PinCodeTextField(
                                  textStyle: TextStyle(
                                    color: otpCubit.isButtonEnabled
                                        ? CustomColors.primaryBlack
                                        : CustomColors.errorColor,
                                  ),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  enablePinAutofill: true,
                                  appContext: context,
                                  length: 4,
                                  onChanged: otpCubit.onOtpEntered,
                                  onCompleted: (value) {},
                                  keyboardType: TextInputType.number,
                                  pinTheme: PinTheme(
                                    inactiveColor: otpCubit.isButtonEnabled
                                        ? CustomColors.inactiveColor
                                        : CustomColors.errorColor,
                                    activeColor: otpCubit.isButtonEnabled
                                        ? CustomColors.inactiveColor
                                        : CustomColors.errorColor,
                                    selectedColor: otpCubit.isButtonEnabled
                                        ? CustomColors.inactiveColor
                                        : CustomColors.errorColor,
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth:
                                        MediaQuery.of(context).size.width / 5.5,
                                    activeFillColor: Colors.white,
                                  ),
                                  animationType: AnimationType.none,
                                ),
                              ),
                            ),
                            if (otpCubit.isButtonEnabled)
                              const SizedBox()
                            else
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'ⓘ Please enter correct otp',
                                  style: TextStyle(
                                    color: CustomColors.errorColor,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (state is OtpTimerTickState)
                                  CustomText.bodyText(
                                    text: "${state.remainTiming.toString()}s",
                                    color: CustomColors.primaryOrange,
                                  )
                                else
                                  CustomText.bodyText(
                                    text: "00:30 ",
                                    color: CustomColors.primaryBlack,
                                  ),
                                if (state is OtpTimeResetState ||
                                    state is OtpTimeExpiredState)
                                  CustomTextBtn(
                                    onTap: () {
                                      otpCubit.otpTimer();
                                      otpCubit.resetTimer();
                                    },
                                    text: 'Resend OTP',
                                    textColor: CustomColors.primaryOrange,
                                    textDecoration: TextDecoration.underline,
                                  )
                                else
                                  const CustomTextBtn(
                                    text: ' Resend OTP in',
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            otpCubit.isButtonEnabled
                                ? CustomButton(
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Routes.signupscreen,
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                    text: 'Continue',
                                    backgroundColor: CustomColors.primaryBlack,
                                  )
                                : const InactiveButton(text: 'Continue'),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    context.read<OtpCubit>().otpTimer();
    super.initState();
  }
}
