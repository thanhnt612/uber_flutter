import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uber/common/widgets/assetGen.dart';
import 'package:uber/constant/commonWidgets/elevatedButton.dart';
import 'package:uber/constant/utils/colors.dart';
import 'package:uber/constant/utils/textStyles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNumberController = TextEditingController();
  String selectedCountryCode = '+91';
  bool loginButtonPressed = false;
  List loginButtonData = [
    [const AssetGen().google.svg(height: 3.h), 'Google'],
    [const AssetGen().apple.svg(height: 3.h), 'Apple'],
    [const AssetGen().facebook.svg(height: 3.h), 'Facebook'],
    [const AssetGen().mail.svg(height: 3.h), 'Email']
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        children: [
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Enter your mobile number',
            style: AppTextStyles.body18,
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  showCountryPicker(
                      context: context,
                      onSelect: (value) {
                        setState(() {
                          selectedCountryCode = '+${value.phoneCode}';
                        });
                      });
                },
                child: Container(
                  height: 6.h,
                  width: 20.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    color: greyShade2,
                    border: Border.all(
                      color: grey,
                    ),
                  ),
                  child: Text(selectedCountryCode),
                ),
              ),
              SizedBox(
                width: 70.w,
                child: TextFormField(
                  controller: mobileNumberController,
                  cursorColor: black,
                  style: AppTextStyles.textFieldTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 2.w,
                    ),
                    hintText: 'Moible number',
                    hintStyle: AppTextStyles.textFieldHintTextStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                      borderSide: BorderSide(
                        color: grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                      borderSide: BorderSide(
                        color: grey,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                      borderSide: BorderSide(
                        color: grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                      borderSide: BorderSide(
                        color: grey,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          ElevatedButtonCommon(
              onPressed: () {},
              backgroundColor: black,
              height: 6.h,
              width: 94.w,
              child: loginButtonPressed == true
                  ? const CircularProgressIndicator()
                  : Text('Continue',
                      style: AppTextStyles.small12Bold.copyWith(color: white)))
        ],
      ),
    ));
  }
}
