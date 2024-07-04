import 'package:castle_couture/api_integration/data_management/user_data_cubit.dart';
import 'package:castle_couture/presentation/a_authentication_screen/login_screen/auth_controller/cubit/login_cubit.dart';
import 'package:castle_couture/presentation/a_authentication_screen/signup_screen/cubit/form_validation_cubit/custom_form_cubit.dart';
import 'package:castle_couture/presentation/b_home_page/c_profile_screen/cubit/profile_form_cubit.dart';
import 'package:castle_couture/presentation/d_customer_info/a_personal_details/cubit/form_validation_cubit/personal_detail_form_cubit.dart';
import 'package:castle_couture/presentation/d_customer_info/b_address_details/cubit/form_validation_cubit/address_form_cubit.dart';
import 'package:castle_couture/presentation/d_customer_info/c_other_details/cubit/form_validation_cubit/other_detail_form_cubit.dart';
import 'package:castle_couture/presentation/d_customer_info/d_payment__details/cubit/cubit/form_validation_cubit/payment_form_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/app_export.dart';
import '../presentation/a_authentication_screen/login_screen/otp_screen/cubit/otp_cubit.dart';

class CustomBlocProvider extends StatelessWidget {
  final Widget child;

  const CustomBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
      ),
      BlocProvider<OtpCubit>(
        create: (context) => OtpCubit(),
      ),
      BlocProvider<CustomFormCubit>(
        create: (context) => CustomFormCubit(),
      ),
      //BlocProvider<BottomCubit>(
      //  create: (context) => BottomCubit(),
      //),
      BlocProvider<PersonalDetailFormCubit>(
        create: (context) => PersonalDetailFormCubit(),
      ),
      BlocProvider<AddressFormCubit>(
        create: (context) => AddressFormCubit(),
      ),
      BlocProvider<OtherDetailsFormCubit>(
        create: (context) => OtherDetailsFormCubit(),
      ),
      BlocProvider<PaymentFormCubit>(
        create: (context) => PaymentFormCubit(),
      ),
      BlocProvider<ProfileFormCubit>(
        create: (context) => ProfileFormCubit(),
      ),
         BlocProvider<UserDataCubit>(
        create: (context) => UserDataCubit(),
      ),
    ], child: child);
  }
}
