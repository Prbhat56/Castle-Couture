// import 'package:castle_couture/api_integration/api_service/api_service.dart';
// import 'package:castle_couture/api_integration/data_model/employee_list_data_model.dart';
// import 'package:castle_couture/core/app_export.dart';
// import 'package:castle_couture/core/utils/global_key_constant.dart';
// import 'package:castle_couture/presentation/a_authentication_screen/login_screen/first_screen/cubit/cubit.dart';
// import 'package:castle_couture/presentation/a_authentication_screen/login_screen/first_screen/cubit/form.dart';
// import 'package:castle_couture/presentation/a_authentication_screen/login_screen/widgets/follow_social_media.dart';
// import 'package:castle_couture/routes/routes.dart';
// import 'package:castle_couture/widgets/app_exit_widget.dart';
// import 'package:castle_couture/widgets/custom_new_text_form_field.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FirstScreen extends StatefulWidget {
//   const FirstScreen({super.key});

//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }

// class _FirstScreenState extends State<FirstScreen> {
//   Future<void> _handleRegisterTap() async {
//     try {
//       String token = await ApiService.generateToken();
//       await _storeToken(token);
//       final SharedPreferences prefs = await SharedPreferences.getInstance();

//       if (prefs.getString('api_token') != null && mounted) {
//         Navigator.pushNamed(context, Routes.signupscreen);
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error generating token: $e')),
//         );
//       }
//     }
//   }

//   Future<void> _storeToken(String token) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('api_token', token);
//   }

//   bool _isVerifying = false;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   @override
//   void dispose() {
//     CastleKeys.castlekey7.currentState?.dispose();
//     super.dispose();
//   }

//   Future<void> _onContinuePressed() async {
//     setState(() {
//       _isVerifying = true;
//     });
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       _showSnackBar('Email and password cannot be empty', Colors.red);
//       return;
//     }

//     String token = await ApiService.generateToken();
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('api_token', token);

//     if (prefs.getString('api_token') != null) {
//       try {
//         List<EmployeeList> employees = await ApiService.fetchEmployeeList();
//         var matchingEmployees = employees.where((employee) =>
//             employee.emailAddress == email &&
//             employee.profileImageUrl == password);

//         if (matchingEmployees.isNotEmpty) {
//           EmployeeList matchedEmployee = matchingEmployees.first;
//           await _storeEmployeeIdAndNavigate(matchedEmployee.id);
//           _showSnackBar('User exists', Colors.green);
//         } else {
//           // Clear the text fields if no match is found
//           _emailController.clear();
//           _passwordController.clear();
//           _showSnackBar(
//               'User with email and password does not exist', Colors.red);
//         }
//       } catch (e) {
//         _showSnackBar('Failed to fetch employee list: $e', Colors.red);
//       }
//     } else {
//       _showSnackBar('Failed to store token', Colors.red);
//     }
//     setState(() {
//       _isVerifying = false; // Verification complete
//     });
//   }

//   void _showSnackBar(String message, Color color) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: color,
//       ),
//     );
//   }

//   Future<void> _storeEmployeeIdAndNavigate(int employeeId) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     await prefs.setInt('employee_id', employeeId);

//     Navigator.pushNamed(context, Routes.homepage);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return BlocBuilder<CustomFirstScreenCubit, CustomFirstScreenFormState>(
//       builder: (context, state) {
//         final cubit = context.read<CustomFirstScreenCubit>();
//         return Scaffold(
//           body: SingleChildScrollView(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 16.0,
//                   horizontal: 14.0,
//                 ),
//                 child: Form(
//                   key: CastleKeys.castlekey7,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.only(top: 50.0.r),
//                         alignment: Alignment.center,
//                         child: CustomImageView(
//                             height: size.height * 0.20,
//                             width: size.width * 0.60,
//                             imagePath: ImageConstant.primaryLogo,
//                             fit: BoxFit.contain),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 14.0, vertical: 14.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           border: Border.all(
//                             color: Colors.grey,
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             CustomText.headline(text: 'Welcome'),
//                             CustomText.spanText(
//                                 text: 'Enter email and password to continue'),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 CustomText.spanText(
//                                   text: "Email",
//                                   color: CustomColors.liteBlack,
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             NewCustomTextFormField(
//                               controller: _emailController,
//                               maxLength: 30,
//                               prefixIcon: const Icon(Icons.email),
//                               labelText: 'Email',
//                               hintText: 'Enter email id',
//                               keyboardType: TextInputType.emailAddress,
//                               onChanged: (value) {
//                                 cubit.onChangedEmail(value);
//                               },
//                               validator: (value) =>
//                                   ValidatorRegex.emailValidator(value),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 CustomText.spanText(
//                                   text: "Password",
//                                   color: CustomColors.liteBlack,
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             NewCustomTextFormField(
//                               obscureText: !state.isPasswordVisible,
//                               controller: _passwordController,
//                               maxLength: 30,
//                               prefixIcon: const Icon(Icons.key),
//                               labelText: 'Password',
//                               hintText: 'Enter password',
//                               keyboardType: TextInputType.visiblePassword,
//                               suffixIcon: InkWell(
//                                 onTap: () {
//                                   cubit.togglePasswordVisibility();
//                                 },
//                                 child: Icon(
//                                   !state.isPasswordVisible
//                                       ? Icons.visibility_off
//                                       : Icons.visibility,
//                                   color: CustomColors.primaryBlack,
//                                 ),
//                               ),
//                               onChanged: (value) {
//                                 cubit.onChangedPassword(value);
//                               },
//                               validator: (value) =>
//                                   ValidatorRegex.passwordValidator(value),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               color: Colors.white,
//                               child: Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 8.0),
//                                   child: _isVerifying
//                                       ? CircularProgressIndicator()
//                                       : (state.isFormValid
//                                           ? CustomButton(
//                                               onTap: _onContinuePressed,
//                                               backgroundColor:
//                                                   CustomColors.primaryBlack,
//                                               text: 'Continue',
//                                             )
//                                           : const InactiveButton(
//                                               text: 'Continue'))),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 CustomText.headline(
//                                   text: "Don't have an account?",
//                                   color: CustomColors.primaryBlack,
//                                 ),
//                                 GestureDetector(
//                                   onTap: _handleRegisterTap,
//                                   child: CustomText.headline(
//                                     text: " Register",
//                                     color: Color.fromARGB(137, 187, 151, 32),
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Wrap(
//                         alignment: WrapAlignment
//                             .center, // Center align the Wrap children
//                         runAlignment:
//                             WrapAlignment.center, // Center align each run
//                         crossAxisAlignment: WrapCrossAlignment
//                             .center, // Center align cross-axis
//                         runSpacing: 2,
//                         children: [
//                      Column(
//                       children: [
//                              Row(
//                             mainAxisSize:
//                                 MainAxisSize.min, // Keep row size to a minimum
//                             children: [
//                               CustomText.spanText(
//                                 text: 'By continuing, I agree to the',
//                                 color: CustomColors.liteBlack,
//                               ),
//                               CustomText.contentText(
//                                 text: 'Terms & Conditions',
//                                 color: CustomColors.primaryBlack,
//                               ),
//                               CustomText.spanText(
//                                 text: ' &',
//                                 color: CustomColors.liteBlack,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisSize:
//                                 MainAxisSize.min, // Keep row size to a minimum
//                             children: [
//                               CustomText.contentText(
//                                 text: 'Privacy policy',
//                                 color: CustomColors.primaryBlack,
//                               ),
//                             ],
//                           ),
//                       ],
//                      )
//                         ],
//                       ),
//                       const Spacer(),
//                       const FollowSocialMedia()
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           /*  body: Center(
//               child: Text('Hello'),
//             ),*/
//         );
//       },
//     );
//   }
// }
