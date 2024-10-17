import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddYourRecipeScr extends StatefulWidget {
  const AddYourRecipeScr({super.key});

  @override
  State<AddYourRecipeScr> createState() => _AddYourRecipeScrState();
}

class _AddYourRecipeScrState extends State<AddYourRecipeScr> {
  dynamic _isFocusedcolor = '';
  List cookadd = [];
  List tooladd = [];
  bool dropopen = false;
  String? selectedpropertyTypeName;
  String? selectedPropertyType;
  // <<<<<<<Controller >>>>>>

  TextEditingController enterecipenameController = TextEditingController();
  TextEditingController enteringredientsController = TextEditingController();
  TextEditingController writehereController = TextEditingController();
  TextEditingController howtocookController = TextEditingController();
  //// list >>>>>>>>>>>
  List<ToolUsed> toolused = [
    ToolUsed(name: 'Hammer'),
    ToolUsed(name: 'Wrench'),
    ToolUsed(name: 'Screwdriver'),
    ToolUsed(name: 'Pliers'),
  ];

  // List of selected items
  List<String> selectedItems = [];

  // Maximum number of selections allowed
  final int maxSelection = 3;
  @override
  void initState() {
    super.initState();
    cookadd.clear();
    tooladd.clear();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
                // focusColor: Colors.amber,
                // splashColor: Colors.blue,
                // hoverColor: Colors.red,
                // highlightColor: Colors.pink,

                borderRadius: BorderRadius.circular(30),
                rippleColor: Colors.white,
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //       builder: (context) => const DashBoardScr(
                  //             pageIndex: 0,
                  //           )),
                  // );
                  // istabExplore = false;
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Text(
                Language().addYourRecipe,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: Fonts.vietna,
                  color: MyColor.black,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Language().addYourRecentCookingMoments,
                          style: const TextStyle(
                            color: MyColor.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: Fonts.vietna,
                          ),
                        ),
                        Text(
                          Language().openyourphotogallerytorecentrecipe,
                          style: const TextStyle(
                            color: MyColor.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            fontFamily: Fonts.vietna,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DottedBorder(
                                color: MyColor.blue,
                                strokeWidth: 2,
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [02, 10],
                                child: TouchRippleEffect(
                                  backgroundColor: Colors.transparent,

                                  // focusColor: Colors.amber,
                                  // splashColor: Colors.blue,
                                  // hoverColor: Colors.red,
                                  // highlightColor: Colors.pink,

                                  borderRadius: BorderRadius.circular(10),
                                  rippleColor: MyColor.blue.withOpacity(0.8),
                                  onTap: () {},
                                  child: Container(
                                      // margin: const EdgeInsets.all(2),
                                      height: size.height * 0.19,
                                      width: size.width * 0.90,
                                      decoration: const BoxDecoration(
                                        color: MyColor.yellowF6F1E1,
                                      ),
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              width: 35,
                                              height: 35,
                                              ImageAsset.addimage),
                                          Text(
                                            Language().addImage,
                                            style: const TextStyle(
                                              color: MyColor.blue,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              fontFamily: Fonts.vietna,
                                            ),
                                          ),
                                        ],
                                      ))),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language().recipeName,
                              style: const TextStyle(
                                color: MyColor.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                fontFamily: Fonts.vietna,
                              ),
                            ),
                            // Text(
                            //   Language().max30Words,
                            //   style: const TextStyle(
                            //     color: MyColor.blue,
                            //     fontWeight: FontWeight.w300,
                            //     fontSize: 14,
                            //     fontFamily: Fonts.vietna,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: _isFocusedcolor == "Enter title"
                                    ? MyColor.liteyellow
                                    : MyColor.graylite),
                            color: MyColor.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
                          height: 55,
                          child: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            onTap: () {
                              _isFocusedcolor = "Enter title";
                              setState(() {});
                            },
                            maxLength: 30,
                            // textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              // String input = phoneController.text;
                              // if (input.isNotEmpty && input.length == 10) {
                              //   loginApi(context, input, countrycode, devicetype,
                              //       devicetoken);
                              // }
                            },

                            buildCounter: (BuildContext context,
                                    {required int currentLength,
                                    int? maxLength,
                                    required bool isFocused}) =>
                                null,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                            // ],
                            controller: enterecipenameController,

                            textInputAction: TextInputAction.next,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: Fonts.vietna,
                              color: MyColor.black,
                            ),
                            // obscureText: _obscureTextpassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: Language()
                                  .enterthenameofyourrecipe
                                  .toString(),
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.only(bottom: 2),
                              //   child: IconButton(
                              //     icon: Icon(
                              //       _obscureTextpassword
                              //           ? Icons.visibility_off
                              //           : Icons.visibility,
                              //       color: MyColor.grayeye,
                              //       size: 25,
                              //     ),
                              //     onPressed: () {
                              //       setState(() {
                              //         _obscureTextpassword = !_obscureTextpassword;
                              //       });
                              //     },
                              //   ),
                              // ),
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyColor.graylite1,
                                fontFamily: Fonts.vietna,
                              ),
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
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language().toolsUsed,
                              style: const TextStyle(
                                color: MyColor.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                fontFamily: Fonts.vietna,
                              ),
                            ),
                            // Text(
                            //   Language().max30Words,
                            //   style: const TextStyle(
                            //     color: MyColor.blue,
                            //     fontWeight: FontWeight.w300,
                            //     fontSize: 14,
                            //     fontFamily: Fonts.vietna,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded:
                                  true, // Ensure dropdown occupies full width
                              hint: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      selectedItems.isEmpty
                                          ? "Select Tools"
                                          : selectedItems.join(', '),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: selectedItems.isEmpty
                                            ? MyColor.graylite1
                                            : MyColor.blue,
                                        fontFamily: Fonts.vietna,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: toolused.map((tool) {
                                return DropdownMenuItem(
                                  value: tool.name,
                                  child: StatefulBuilder(
                                    builder: (
                                      context,
                                      menuSetState,
                                    ) {
                                      final isSelected =
                                          selectedItems.contains(tool.name);

                                      return Wrap(
                                        children: [
                                          ListTile(
                                            minTileHeight: 30,
                                            contentPadding: EdgeInsets.zero,
                                            title: SizedBox(
                                              height: 20,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Transform.scale(
                                                    scale:
                                                        1.5, // Scale to make the checkbox larger
                                                    child: Checkbox(
                                                      shape: const CircleBorder(
                                                        side: BorderSide.none,
                                                      ),
                                                      value: isSelected,
                                                      activeColor: Colors.white,
                                                      checkColor: MyColor.blue,
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                      side:
                                                          MaterialStateBorderSide
                                                              .resolveWith(
                                                        (states) =>
                                                            const BorderSide(
                                                          color: MyColor.blue,
                                                          width: 1,
                                                        ),
                                                      ),
                                                      onChanged: (value) {
                                                        if (value == true) {
                                                          setState(() {
                                                            selectedItems
                                                                .add(tool.name);
                                                          });
                                                        } else if (value ==
                                                            false) {
                                                          setState(() {
                                                            selectedItems
                                                                .remove(
                                                                    tool.name);
                                                          });
                                                        }
                                                        menuSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      tool.name,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: MyColor.blue,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.only(
                                          //       top: 2, bottom: 12),
                                          //   child: Divider(
                                          //     height: 1,
                                          //   ),
                                          // ),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                              value: null,
                              // Leave value null for multiple selections
                              onMenuStateChange: (isOpen) {
                                dropopen = isOpen;
                                _isFocusedcolor = "dropdwon";
                                setState(() {});
                              },

                              onChanged: (value) {
                                _isFocusedcolor = "dropdwon";
                                debugPrint("$value");
                                if (selectedItems.contains(value) == false) {
                                  setState(() {
                                    selectedItems.add(value!);
                                  });
                                } else {
                                  setState(() {
                                    selectedItems.remove(value);
                                  });
                                }
                              }, // No action needed here
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width:
                                    size.width * 0.95, // Ensure button is wide
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: _isFocusedcolor == "dropdwon"
                                          ? MyColor.liteyellow
                                          : MyColor.graylite),
                                ),
                                elevation: 0,
                              ),
                              iconStyleData: IconStyleData(
                                icon: dropopen == true
                                    ? const Icon(Icons.arrow_drop_up_sharp)
                                    : const Icon(Icons.arrow_drop_down),
                                iconSize: 20,
                                iconEnabledColor: MyColor.blue,
                                iconDisabledColor: MyColor.graylite,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 250,
                                width: size.width * 0.93, // Set dropdown width
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: MyColor.white,
                                  border: Border.all(color: MyColor.graylite),
                                ),
                                offset: const Offset(0, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(20),
                                  thickness: WidgetStateProperty.all<double>(6),
                                  thumbVisibility:
                                      WidgetStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 1, right: 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 15, top: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language().toolsUsed,
                              style: const TextStyle(
                                color: MyColor.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                fontFamily: Fonts.vietna,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                enteringredientsController.text.isNotEmpty ||
                                        tooladd.contains(
                                                enteringredientsController
                                                    .text) ==
                                            false
                                    ? tooladd
                                        .add(enteringredientsController.text)
                                    : "";
                                enteringredientsController.clear();
                                setState(() {});
                              },
                              child: Text(
                                "${Language().add}+",
                                style: const TextStyle(
                                  color: MyColor.blue,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: Fonts.vietna,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: _isFocusedcolor ==
                                        "Enter the ingredients you need"
                                    ? MyColor.liteyellow
                                    : MyColor.graylite),
                            color: MyColor.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
                          height: 88,
                          child: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            onTap: () {
                              _isFocusedcolor =
                                  "Enter the ingredients you need";
                              setState(() {});
                            },
                            // maxLength: 30,
                            // textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              // String input = phoneController.text;
                              // if (input.isNotEmpty && input.length == 10) {
                              //   loginApi(context, input, countrycode, devicetype,
                              //       devicetoken);
                              // }
                            },

                            buildCounter: (BuildContext context,
                                    {required int currentLength,
                                    int? maxLength,
                                    required bool isFocused}) =>
                                null,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                            // ],
                            controller: enteringredientsController,

                            textInputAction: TextInputAction.next,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: Fonts.vietna,
                              color: MyColor.black,
                            ),
                            // obscureText: _obscureTextpassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: Language()
                                  .entertheingredientsyouneed
                                  .toString(),
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.only(bottom: 2),
                              //   child: IconButton(
                              //     icon: Icon(
                              //       _obscureTextpassword
                              //           ? Icons.visibility_off
                              //           : Icons.visibility,
                              //       color: MyColor.grayeye,
                              //       size: 25,
                              //     ),
                              //     onPressed: () {
                              //       setState(() {
                              //         _obscureTextpassword = !_obscureTextpassword;
                              //       });
                              //     },
                              //   ),
                              // ),
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyColor.graylite1,
                                fontFamily: Fonts.vietna,
                              ),
                              counter: const Offstage(),
                              isDense: true,
                              // this will remove the default content padding
                              contentPadding: const EdgeInsets.only(
                                top: 10,
                              ),
                            ),
                            maxLines: 10,
                            cursorColor: MyColor.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 0, right: 15, bottom: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 08),
                                itemCount: tooladd.length,
                                shrinkWrap:
                                    true, // Add this to fix the height issue
                                physics:
                                    const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            height: 19,
                                            width: 20,
                                            ImageAsset.dots),
                                        Expanded(
                                          child: Text(
                                            tooladd[index],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: Fonts.vietna,
                                              color: MyColor.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 15, top: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language().howtoCook,
                              style: const TextStyle(
                                color: MyColor.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                fontFamily: Fonts.vietna,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                howtocookController.text.isNotEmpty ||
                                        cookadd.contains(
                                                howtocookController.text) ==
                                            false
                                    ? cookadd.add(howtocookController.text)
                                    : "";
                                howtocookController.clear();
                                setState(() {});
                              },
                              child: Text(
                                "${Language().add}+",
                                style: const TextStyle(
                                  color: MyColor.blue,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: Fonts.vietna,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: _isFocusedcolor ==
                                        "Enter the steps to cook your recipe"
                                    ? MyColor.liteyellow
                                    : MyColor.graylite),
                            color: MyColor.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
                          height: 88,
                          child: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            onTap: () {
                              _isFocusedcolor =
                                  "Enter the steps to cook your recipe";
                              setState(() {});
                            },
                            // maxLength: 30,
                            // textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              // String input = phoneController.text;
                              // if (input.isNotEmpty && input.length == 10) {
                              //   loginApi(context, input, countrycode, devicetype,
                              //       devicetoken);
                              // }
                            },

                            buildCounter: (BuildContext context,
                                    {required int currentLength,
                                    int? maxLength,
                                    required bool isFocused}) =>
                                null,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                            // ],
                            controller: howtocookController,

                            textInputAction: TextInputAction.next,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: Fonts.vietna,
                              color: MyColor.black,
                            ),
                            // obscureText: _obscureTextpassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: Language()
                                  .enterthestepstocookyourrecipe
                                  .toString(),
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.only(bottom: 2),
                              //   child: IconButton(
                              //     icon: Icon(
                              //       _obscureTextpassword
                              //           ? Icons.visibility_off
                              //           : Icons.visibility,
                              //       color: MyColor.grayeye,
                              //       size: 25,
                              //     ),
                              //     onPressed: () {
                              //       setState(() {
                              //         _obscureTextpassword = !_obscureTextpassword;
                              //       });
                              //     },
                              //   ),
                              // ),
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyColor.graylite1,
                                fontFamily: Fonts.vietna,
                              ),
                              counter: const Offstage(),
                              isDense: true,
                              // this will remove the default content padding
                              contentPadding: const EdgeInsets.only(
                                top: 10,
                              ),
                            ),
                            maxLines: 10,
                            cursorColor: MyColor.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 0, right: 15, bottom: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 08),
                                itemCount: cookadd.length,
                                shrinkWrap:
                                    true, // Add this to fix the height issue
                                physics:
                                    const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Step ${(index + 1)} - ",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: Fonts.vietna,
                                            color: MyColor.blue,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            cookadd[index],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: Fonts.vietna,
                                              color: MyColor.blue,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: size.width * 0.95,
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColor.blue,
                      // surfaceTintColor: MyColor.white,
                      overlayColor: MyColor.liteyellow,
                      enableFeedback: true,

                      enabledMouseCursor: MouseCursor.defer,
                      // Background color
                      // Text color (alternative)
                      elevation: 5, // Optional: elevation (shadow)
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Custom padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(34), // Custom shape
                      ),
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //         builder: (context) => const DashBoardScr(
                      //               pageIndex: 0,
                      //             )),
                      //     (Route<dynamic> route) => false);
                    },
                    child: Text(
                      Language().add.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: Fonts.vietna,
                        color: MyColor.white,
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToolUsed {
  final String name;

  ToolUsed({required this.name});
}
