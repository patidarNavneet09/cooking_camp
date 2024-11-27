import 'dart:io';
import 'package:cooking_champs/constant/app_state.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/enums/register_enum.dart';
import 'package:cooking_champs/model/dynamic_models/my_child_listing_model.dart';
import 'package:cooking_champs/model/post_model/kids_register_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/widgets/child_profile_created_popup.dart';
import 'package:cooking_champs/widgets/custom_month_picker.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:cooking_champs/widgets/image_picker_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import '../dashboard.dart';

class KidsRegisterScreen extends StatefulWidget {
  final bool check;
  final bool? editCheck;
  final Function? onCallBack;
  final Items? myChildModel;

  const KidsRegisterScreen(
      {super.key,
      required this.check,
      this.editCheck,
      this.onCallBack,
      this.myChildModel});

  @override
  State<KidsRegisterScreen> createState() => _KidsRegisterScreenState();
}

class _KidsRegisterScreenState extends State<KidsRegisterScreen> {
  // <<<<<<<Controller >>>>>>

  TextEditingController nameController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Items myChildModel = Items();
  List<XFile> imageFileList = [];
  File? selectedImage;
  dynamic isFocusColor = '';
  dynamic image;



  String nameError = "";
  String userNameError = "";
  String gradeError = "";
  String yearError = "";
  String passError = "";
  String selectDate2 = "";
  int? selectedMonth; // Get current month (0-based index)
  String kidImage = "";

  bool isPassHide = true;
  bool isConPassHide = true;
  bool isValidate = false;
  bool isImage = false;

  String passwordImage = AssetsPath.hideEyeIc;
  String conPasswordImage = AssetsPath.hideEyeIc;

  @override
  void initState() {
    setData();
    super.initState();
  }

  setData() {
    if (widget.editCheck == true) {
      myChildModel = widget.myChildModel!;
      if (myChildModel.id != null) {
        if (mounted) {
          setState(() {
            nameController.text = myChildModel.name ?? "";
            dayController.text = myChildModel.day ?? "";
            monthController.text = myChildModel.month ?? "";
            yearController.text = myChildModel.year ?? "";
            gradeController.text = myChildModel.grade ?? "";
            userNameController.text = myChildModel.username ?? "";
            passController.text = myChildModel.password ?? "";
            kidImage = ApiPath.imageBaseUrl + myChildModel.kidImage.toString();
          });
        }
      }
    }
    final now = DateTime.now();
   selectedMonth = now.month - 1; // Get current month (0-based index)
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: widget.check == true
          ? AppBar(
              leadingWidth: 0,
              automaticallyImplyLeading: false,
              backgroundColor: MyColor.yellowF6F1E1,
              surfaceTintColor: MyColor.yellowF6F1E1,
              title: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TouchRippleEffect(
                      borderRadius: BorderRadius.circular(30),
                      rippleColor: Colors.white,
                      onTap: () {
                        Navigator.pop(context);
                        isTabExplore = false;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                        widget.editCheck == true
                            ? Languages.of(context)!.editKidProfile
                            : Languages.of(context)!.addAnotherKid,
                        style: mediumTextStyle(
                            fontSize: 18.0, color: MyColor.black)),
                  ],
                ),
              ),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.check == true
                    ? Container()
                    : SizedBox(
                        height: size.height * 0.06,
                      ),
                widget.check == true
                    ? Container()
                    : Image.asset(
                        width: 110,
                        height: 60,
                        AssetsPath.antapanta,
                        fit: BoxFit.contain,
                      ),
                widget.check == true
                    ? Container()
                    : SizedBox(
                        height: size.height * 0.01,
                      ),
                widget.check == true
                    ? Container()
                    : Text(Languages.of(context)!.letCreateYourKidChampProfile,
                        textAlign: TextAlign.center,
                        style: regularTextStyle(
                            fontSize: 20.0, color: MyColor.black)),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        AllDialogs.globalBottomSheet(context,
                            ImagePickerDialog(onCallBack: onCallBack), () {});
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                              child: selectedImage != null
                                  ? Image.file(
                                      selectedImage!,
                                      height: 100,width: 100,
                                      fit: BoxFit.contain,
                                    )
                                  :  kidImage.isNotEmpty
                                  ? UiUtils.networkProfile(
                                      100, 100, kidImage)
                                  :Image.asset(
                                      AssetsPath.demoPerson,
                                      fit: BoxFit.contain,
                                height: 100,width: 100,
                                    ),),
                          Positioned(
                            left: 70,
                            top: 60,
                            child: CircleAvatar(
                              backgroundColor: MyColor.appTheme,
                              radius: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(
                                  AssetsPath.addimage,
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                  color: MyColor.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hsized20,
                      headingText(
                          Languages.of(context)!.yourChampFullName.toString()),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      titleText(
                          Languages.of(context)!.name.toString(), nameError),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      commonTextField(
                          nameController,
                          Languages.of(context)!.entername.toString(),
                          TextInputAction.next,
                          TextInputType.text,
                          "Name"),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      headingText(
                          Languages.of(context)!.dateofbirth.toString()),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Languages.of(context)!.day.toString(),
                              style: regularTextStyle(
                                  fontSize: 14.0, color: MyColor.black)),
                          Text(Languages.of(context)!.optional.toString(),
                              style: regularTextStyle(
                                  fontSize: 14.0, color: MyColor.appTheme)),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      dropDownTextField(
                          dayController,
                          Languages.of(context)!
                              .selectyourcampbornday
                              .toString(),
                          "Day",
                          dayOnTap),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Languages.of(context)!.month.toString(),
                              style: regularTextStyle(
                                  fontSize: 14.0, color: MyColor.black)),
                          Text(Languages.of(context)!.optional.toString(),
                              style: regularTextStyle(
                                  fontSize: 14.0, color: MyColor.appTheme)),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      dropDownTextField(
                          monthController,
                          Languages.of(context)!.selectyourcampmanth.toString(),
                          "Month",
                          monthOnTap),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      titleText(
                          Languages.of(context)!.year.toString(), yearError),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      dropDownTextField(
                          yearController,
                          Languages.of(context)!.selectyourcampyear.toString(),
                          "Year",
                          yearOnTap),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      headingText(Languages.of(context)!
                          .whichclassgradearetheyin
                          .toString()),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Languages.of(context)!.classgrade.toString(),
                              style: regularTextStyle(
                                  fontSize: 14.0, color: MyColor.black)),
                          UiUtils.errorText(gradeError)
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      commonTextField(
                          gradeController,
                          Languages.of(context)!.enterclassgrade.toString(),
                          TextInputAction.next,
                          TextInputType.text,
                          "Class Grade"),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(Languages.of(context)!.username.toString(),
                                  style: regularTextStyle(
                                      fontSize: 14.0, color: MyColor.black)),
                            ],
                          ),
                          UiUtils.errorText(userNameError)
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      commonTextField(
                          userNameController,
                          Languages.of(context)!.enterusername.toString(),
                          TextInputAction.done,
                          TextInputType.text,
                          "UserName"),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(Languages.of(context)!.password.toString(),
                                  style: regularTextStyle(
                                      fontSize: 14.0, color: MyColor.black)),
                            ],
                          ),
                          UiUtils.errorText(passError)
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      commonTextField(
                          passController,
                          Languages.of(context)!.enterpassword.toString(),
                          TextInputAction.done,
                          TextInputType.text,
                          "Password"),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      GlobalButton(
                          widget.editCheck == true ?
                          Languages.of(context)!.updateKidProfile.toString():
                          Languages.of(context)!.createKidProfile.toString(),
                          MyColor.appTheme,
                          MyColor.appTheme,
                          btnSize55,
                          double.infinity,
                          checkValidation,
                          55,
                          5,
                          0,
                          mediumTextStyle(
                              fontSize: 16.0, color: MyColor.white)),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  headingText(String string) {
    return Text(string,
        style: semiBoldTextStyle(fontSize: 14.0, color: MyColor.black));
  }

  titleText(String string, String error) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(string,
                style: regularTextStyle(fontSize: 14.0, color: MyColor.black)),
            Text(" *",
                style: regularTextStyle(fontSize: 14.0, color: MyColor.red)),
          ],
        ),
        error.isEmpty
            ? SizedBox.shrink()
            : Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: UiUtils.errorText(error)))
      ],
    );
  }

  /// Password hide show..................
  void hideShowPass() {
    setState(() {
      isPassHide = !isPassHide;
      if (isPassHide) {
        passwordImage = AssetsPath.eyeIc;
      } else {
        passwordImage = AssetsPath.hideEyeIc;
      }
    });
  }

  /// set Suffix icon............
  suffixIconSet(String type) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 7),
      child: type == "Password"
          ? GestureDetector(
              onTap: hideShowPass,
              child: SvgPicture.asset(
                passwordImage,
              ))
          : const SizedBox(height: 10, width: 10),
    );
  }

  commonTextField(
    TextEditingController controller,
    String labelText,
    TextInputAction textInputAction,
    TextInputType textInputType,
    String type,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color:
                isFocusColor == type ? MyColor.liteOrange : MyColor.grayLite),
        color: MyColor.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
      height: 55,
      child: TextField(
        obscureText: type == "Password" ? isPassHide : false,
        textCapitalization: TextCapitalization.sentences,
        onTap: () {
          if (mounted) {
            setState(() {
              isFocusColor = type;
            });
          }
        },
        buildCounter: (BuildContext context,
                {required int currentLength,
                int? maxLength,
                required bool isFocused}) =>
            null,
        controller: controller,
        onTapOutside: (v) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        textInputAction: textInputAction,
        keyboardType: textInputType,
        style: regularTextStyle(fontSize: 14.0, color: MyColor.black),
        decoration: InputDecoration(
          suffixIcon: suffixIconSet(type),
          border: InputBorder.none,
          hintText: labelText,
          hintStyle: regularTextStyle(fontSize: 14.0, color: MyColor.grayLite1),
          counter: const Offstage(),
          isDense: true,
          // this will remove the default content padding
          contentPadding: const EdgeInsets.only(
            top: 10,
          ),
        ),
        maxLines: 1,
        cursorColor: MyColor.black,
      ),
    );
  }

  dropDownTextField(TextEditingController controller, String labelText,
      String type, GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: isFocusColor == type
                    ? MyColor.liteOrange
                    : MyColor.grayLite),
            color: MyColor.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.text.trim().isEmpty ? labelText : controller.text,
                style: regularTextStyle(
                    fontSize: 14.0,
                    color: controller.text.trim().isEmpty
                        ? MyColor.grayLite1
                        : MyColor.black),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 25,
              ),
            ],
          )),
    );
  }

  onCallBack(dynamic file) {
    if (mounted) {
      setState(() {
        image = file;
        selectedImage = File(file.path);
        isImage = true;
      });
    }
  }

  checkValidation() {
    if (widget.editCheck == true) {
      kidUpdate();
    } else {
      if (mounted) {
        isValidate = true;
        if (nameController.text.trim().isEmpty) {
          nameError = Languages.of(context)!.enterName;
          isValidate = false;
        }
        if (yearController.text.trim().isEmpty) {
          yearError = Languages.of(context)!.enterYear;
          isValidate = false;
        }
        if (gradeController.text.trim().isEmpty) {
          gradeError = Languages.of(context)!.enterGrade;
          isValidate = false;
        }

        if (userNameController.text.trim().isEmpty) {
          userNameError = Languages.of(context)!.username.toString();
          isValidate = false;
        }
        if (passController.text.trim().isEmpty ||
            passController.text.length < 6) {
          passError = Languages.of(context)!.atleast5.toString();
          isValidate = false;
        } else if (yearController.text.trim().isEmpty) {
          Utility.customToast(context, "Please select year");
          isValidate = false;
        } else if (!isImage) {
          Utility.customToast(
              context, Languages.of(context)!.pleaseUploadProfile);
          isValidate = false;
        }
        setState(() {});
        if (isValidate) {
          nameError = "";
          userNameError = "";
          gradeError = "";
          yearError = "";
          passError = "";
          kidRegister();
        }
      }
    }
  }

  kidRegister() async {
    String fcm =
        await PreferencesServices.getPreferencesData(PreferencesServices.fcm) ??
            "";
    String parentId = await PreferencesServices.getPreferencesData(
            PreferencesServices.parentId) ??
        "";
    KidsRegisterModel kidsRegisterModel = KidsRegisterModel(
        role: RegisterType.roleKids.value,
        parentId: int.parse(parentId),
        name: nameController.text,
        day: int.parse(dayController.text.toString()),
        month: monthController.text.trim().isNotEmpty
            ? Utility.formatDateToMonthDay(selectDate2)
            : "",
        year: yearController.text,
        grade: gradeController.text,
        username: userNameController.text,
        password: passController.text,
        fcmToken: fcm,
        deviceId: AppState.deviceIdStr,
        deviceType: AppState.devicetype);

    await ApiServices.kidsRegister(context, kidsRegisterModel, image)
        .then((onValue) {
      if (mounted) {
        if (onValue.status != null && onValue.status != false) {
          AllDialogs.customDialog(
              context,
              ChildProfileCreatedPopup(
                name: nameController.text,
                check: widget.check,
                onCallBack: onUpdate,
                title: Languages.of(context)!.childprofilecreated,
                des:
                    "Great! You’ve successfully created   ${nameController.text} profile. Would you like to add another child?",
              ));
        } else {
          if (onValue.error != null) {
            Utility.customToast(context, onValue.error.toString());
          }
        }
      }
    });
  }

  kidUpdate() async {
    KidsRegisterModel kidsRegisterModel = KidsRegisterModel(
      role: RegisterType.roleKids.value,
      kidId: int.parse(myChildModel.id.toString()),
      name: nameController.text,
      day: int.parse(dayController.text.toString()),
      month: monthController.text.trim().isNotEmpty
          ? selectDate2.isEmpty
              ? monthController.text
              : Utility.formatDateToMonthDay(selectDate2)
          : "",
      year: yearController.text,
      grade: gradeController.text,
      username: userNameController.text,
      password: passController.text,
    );
    if (widget.editCheck == true) {
      await ApiServices.updateKidProfile(context, kidsRegisterModel, image)
          .then((onValue) {
        if (mounted) {
          if (onValue.status != null && onValue.status != false) {
            AllDialogs.customDialog(
                context,
                ChildProfileCreatedPopup(
                  name: nameController.text,
                  check: widget.check,
                  onCallBack: onUpdate,
                  title: Languages.of(context)!.childProfileUpdated,
                  des:
                      "Great! You’ve successfully updated   ${nameController.text} profile. Would you like to add another child?",
                ));
          } else {
            if (onValue.error != null) {
              Utility.customToast(context, onValue.error.toString());
            }
          }
        }
      });
    }
  }

  void firstNameOnTap() {
    if (mounted) {
      setState(() {
        isFocusColor = "First Name";
      });
    }
  }

  void lastNameOnTap() {
    if (mounted) {
      setState(() {
        isFocusColor = "Last Name";
      });
    }
  }

  void dayOnTap() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );

    if (selectedDate != null) {
      dayController.text = selectedDate.day.toString().padLeft(2, '0');
      setState(() {});
    }
    isFocusColor = "lastName";
    setState(() {});
  }

  void monthOnTap() async {
    AllDialogs.customDialog(context, CustomMonthPicker(
      onMonthSelected: (selectedMonth1) {
        setState(() {
          selectedMonth = int.parse(selectedMonth1);
          final now = DateTime.now();
          final formattedDate =
              "${now.year}-$selectedMonth1-01 00:00:00.000"; // Example: first day of selected month
          selectDate2 = formattedDate;
          monthController.text = Utility.formatDateToMonthDay(formattedDate);
          debugPrint("month...${Utility.formatDateToMonthDay1(formattedDate)}") ;
        });
      }, currentMonthIndex:selectedMonth!,
    ));
    isFocusColor = "parentEmail";
  }

  void yearOnTap() async {
   /* AllDialogs.customDialog(context, SizedBox(
      height: 200,
      child: CustomYearPicker(
        onYearSelected: (selectedYear) {
          setState(() {
            yearController.text = selectedYear.toString();
          });
        },
      ),
    )
    );*/

    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2025),
        initialDatePickerMode: DatePickerMode.year);

    if (selectedDate != null) {
      setState(() {
        yearController.text = selectedDate.year.toString();
      });
    }
    isFocusColor = "emailstar";
    setState(() {});
  }

  onUpdate() {
    if (widget.check == true) {
      Navigator.pop(context);
      if (widget.onCallBack != null) {
        widget.onCallBack!();
      }
    }
  }
}
