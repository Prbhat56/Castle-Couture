import 'package:castle_couture/presentation/a_authentication_screen/login_screen/auth_controller/cubit/login_cubit.dart';
import 'package:castle_couture/presentation/a_authentication_screen/login_screen/widgets/follow_social_media.dart';
import 'package:castle_couture/presentation/a_authentication_screen/login_screen/widgets/phone_text_field.dart';
import 'package:castle_couture/routes/routes.dart';
import 'package:castle_couture/widgets/app_exit_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_integration/api_service/api_service.dart';
import '../../../core/app_export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        CustomShowDialog.buildExitDialog(context);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50.0.r),
                    alignment: Alignment.center,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 14.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            CustomText.headline(text: 'Welcome'),
                            CustomText.spanText(
                                text: 'Enter phone number to continue'),
                            const SizedBox(
                              height: 20,
                            ),
                            PhoneTextField(
                              controller: _numberController,
                              onChanged: (value) {
                                context
                                    .read<LoginCubit>()
                                    .validatePhoneNumber(value);
                              },
                              maxLength: 10,
                              prefixIcon: const Icon(Icons.phone),
                              labelText: 'Phone number',
                              hintText: 'Enter phone number',
                              keyboardType: TextInputType.number,
                              errorColor: state is LoginInValidState
                                  ? CustomColors.errorColor
                                  : CustomColors.liteBlack,
                              errorText: state is LoginInValidState
                                  ? 'ⓘ Enter 10 digit mobile number'
                                  : '',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                if (state is LoginLoadingState) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return CustomButton(
                                    onTap: () => _handleLogin(context),
                                    text: 'Continue',
                                    backgroundColor: (state is LoginValidState)
                                        ? CustomColors.primaryBlack
                                        : CustomColors.inactiveColor,
                                  );
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              spacing: 2,
                              runSpacing: 2,
                              children: [
                                CustomText.spanText(
                                  text: 'By continuing, I agree to the',
                                  color: CustomColors.liteBlack,
                                ),
                                CustomText.contentText(
                                  text: 'Terms & Conditions',
                                  color: CustomColors.primaryBlack,
                                ),
                                CustomText.spanText(
                                  text: '&',
                                  color: CustomColors.liteBlack,
                                ),
                                CustomText.contentText(
                                  text: 'Privacy policy',
                                  color: CustomColors.primaryBlack,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  const FollowSocialMedia()
                ],
              ),
            ),
          ),
        ),
        /*  body: Center(
            child: Text('Hello'),
          ),*/
      ),
    );
  }

  void _handleLogin(BuildContext context) async {
    context.read<LoginCubit>().setLoading(true);

    try {
      String token = await ApiService.generateToken();
      await _storeTokenAndPhoneNumber(token, _numberController.text);
      Navigator.pushNamed(context, Routes.signupscreen);
    } catch (e) {
      // Handle error
    } finally {
      context.read<LoginCubit>().setLoading(false);
    }
  }

  Future<void> _storeTokenAndPhoneNumber(
      String token, String phoneNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('api_token');

    await prefs.setString('api_token', token);
    await prefs.setString('phone_number', phoneNumber);
  }
}
