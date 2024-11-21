import 'dart:io';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/dynamic_models/recipe_model.dart';
import 'package:cooking_champs/model/dynamic_models/recipe_tools_model.dart';
import 'package:cooking_champs/model/post_model/add_recipe_request.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:cooking_champs/widgets/image_picker_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddYourRecipeView extends StatefulWidget {
  final Function onCallBack;
  const AddYourRecipeView({super.key,required this.onCallBack});

  @override
  State<AddYourRecipeView> createState() => _AddYourRecipeViewState();
}

class _AddYourRecipeViewState extends State<AddYourRecipeView> {
  TextEditingController recipeNameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController cookController = TextEditingController();

  List<RecipeToolsModel> recipeToolsList = [];
  List<RecipeModel> recipeList = [];

  List<XFile> imageFileList = [];
  List cookList = [];
  List ingredientsList = [];
  List<String> selectedRecipeToolsList = [];
  List<String> selectedItems = [];
  File? selectedImage;

  dynamic image;
  dynamic isFocusColor = '';

  bool isTools = false;
  bool isUpdateIngredients = false;
  bool isUpdateCook = false;
  int ingredientsIndex = 0;
  int cookIndex = 0;



  // Maximum number of selections allowed
  final int maxSelection = 3;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getRecipeTools(true);
    });
    cookList.clear();
    ingredientsList.clear();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        automaticallyImplyLeading: false,
        backgroundColor: MyColor.yellowF6F1E1,
        surfaceTintColor: MyColor.yellowF6F1E1,
        leading: InkWell(
          borderRadius: BorderRadius.circular(30),
          radius: 80,
          onTap: () {
            Navigator.pop(context);
          //  widget.onCallBack();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 28,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(Languages.of(context)!.addYourRecipe,
            style: mediumTextStyle(fontSize: 18.0, color: MyColor.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Languages.of(context)!.addYourRecentCookingMoments,
                        style: mediumTextStyle(
                            fontSize: 18.0, color: MyColor.black)),
                    Text(
                        Languages.of(context)!
                            .openyourphotogallerytorecentrecipe,
                        style: regularNormalTextStyle(fontSize: 14.0, color: MyColor.black)),
                    hsized30,
                    imgUi(size),
                    hsized30,
                    Text(Languages.of(context)!.recipeName,
                        style: regularTextStyle(
                            fontSize: 15.0, color: MyColor.black)),
                    hsized10,
                    commonTextField(
                        recipeNameController,
                        Languages.of(context)!
                            .enterTheNameIfYourRecipe
                            .toString(),
                        TextInputAction.done,
                        TextInputType.text,
                        "Recipe Name",
                        2,
                        1),
                  ],
                ),
              ),

              hsized10,
              UiUtils.dividerLine(),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hsized20,
                    Text(Languages.of(context)!.toolsUsed,
                        style: regularTextStyle(
                            fontSize: 15.0, color: MyColor.black)),
                    hsized15,
                    Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          // Ensure dropdown occupies full width
                          hint: Text(
                            selectedItems.isEmpty ? "Select Tools" : selectedItems.join(', '),
                            style: regularTextStyle(fontSize: 14.0, color: selectedItems.isEmpty ? MyColor.grayLite1 : MyColor.appTheme),
                            overflow: TextOverflow.ellipsis,
                          ),
                          items: recipeToolsList.map((tool) {
                            return DropdownMenuItem(
                              value: tool.toolName ?? "",
                              child: StatefulBuilder(
                                builder: (
                                  context,
                                  menuSetState,
                                ) {
                                  final isSelected = selectedItems
                                      .contains(tool.toolName ?? "");

                                  return Wrap(
                                    children: [
                                      ListTile(
                                        minTileHeight: 30,
                                        contentPadding: EdgeInsets.zero,
                                        title: SizedBox(
                                          height: 20,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Transform.scale(
                                                scale: 1.5,
                                                // Scale to make the checkbox larger
                                                child: Checkbox(
                                                  shape: const CircleBorder(
                                                    side: BorderSide.none,
                                                  ),
                                                  value: isSelected,
                                                  activeColor: Colors.white,
                                                  checkColor: MyColor.appTheme,
                                                  fillColor:
                                                      MaterialStateProperty.all(
                                                          Colors.transparent),
                                                  side: MaterialStateBorderSide
                                                      .resolveWith(
                                                    (states) =>
                                                        const BorderSide(
                                                      color: MyColor.appTheme,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  onChanged: (value) {
                                                    menuSetState(() {
                                                      if (value == true) {
                                                        selectedItems.add(tool.toolName ?? "");
                                                        selectedRecipeToolsList.add(tool.id.toString());
                                                      } else if (value == false) {
                                                        selectedItems.remove(tool.toolName ?? "");
                                                        selectedRecipeToolsList.remove(tool.id.toString());
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(tool.toolName ?? "",
                                                    style: mediumTextStyle(
                                                        fontSize: 14.0,
                                                        color:
                                                            MyColor.appTheme)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      hsized10,
                                    ],
                                  );
                                },
                              ),
                            );
                          }).toList(),
                          value: null,
                          // Leave value null for multiple selections
                          onMenuStateChange: (isOpen) {
                            setState(() {
                              isTools = isOpen;
                              isFocusColor = "dropdwon";
                            });
                          },

                          onChanged: (value) {
                            isFocusColor = "dropdwon";
                            setState(() {
                            if (selectedItems.contains(value) == false) {
                              selectedItems.add(value!);
                            } else {
                                selectedItems.remove(value);
                            }
                          });
                          },
                          // No action needed here
                          buttonStyleData: ButtonStyleData(
                            height: 52,
                            width: size.width * 0.95,
                            // Ensure button is wide
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent,
                              border: Border.all(
                                  color: isFocusColor == "dropdwon" ? MyColor.liteOrange : MyColor.grayLite),
                            ),
                            elevation: 0,
                          ),
                          iconStyleData: IconStyleData(
                            icon: isTools == true
                                ? const Icon(Icons.arrow_drop_up_sharp)
                                : const Icon(Icons.arrow_drop_down),
                            iconSize: 20,
                            iconEnabledColor: MyColor.appTheme,
                            iconDisabledColor: MyColor.grayLite,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 250,
                            width: size.width * 0.93,
                            // Set dropdown width
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: MyColor.white,
                              border: Border.all(color: MyColor.grayLite),
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
                    hsized10,
                  ],
                ),
              ),

              UiUtils.dividerLine(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 10, top: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Languages.of(context)!.ingredients,
                            style: regularTextStyle(
                                fontSize: 15.0, color: MyColor.black)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if( ingredientsController.text.trim().isNotEmpty && ingredientsList.contains(ingredientsController.text.trim()) == false){
                                if(!isUpdateIngredients) {
                                  ingredientsList.add(ingredientsController.text.trim());
                                }else{
                                  ingredientsList[ingredientsIndex] = ingredientsController.text.trim(); // Replace the item at the specified index with a new value
                                }
                              }
                              isUpdateIngredients = false;
                              ingredientsController.clear();
                            });
                          },
                          child: Text(!isUpdateIngredients?"${Languages.of(context)!.add}+":Languages.of(context)!.update,
                              style: regularTextStyle(
                                  fontSize: 14.0, color: MyColor.appTheme)),
                        ),
                      ],
                    ),
                    hsized15,

                    commonTextField(
                        ingredientsController,
                        Languages.of(context)!.enterIngredients.toString(),
                        TextInputAction.done,
                        TextInputType.text,
                        "ingredients",
                        10,
                        3),

                    Padding(
                      padding: const EdgeInsets.only(top:0.0, left: 0, right: 15, bottom:10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 08),
                            itemCount: ingredientsList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                              height: 19, width: 20, AssetsPath.dots),
                                          Expanded(
                                            child: Text(
                                              ingredientsList[index],
                                              style: regularTextStyle(fontSize: 14.0, color:MyColor.black)
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            ingredientsIndex = index;
                                            setState(() {});
                                            AllDialogs.globalBottomSheet(context,UpdateDeletePopup(onUpdate:onUpdateDeleteIngredient, text:ingredientsList[index], title: 'Ingredients',),(){});
                                          },
                                          child:  Icon(Icons.more_vert,color: MyColor.black,size: 18,)
                                        ),

                                      ],
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

//              hsized15,

              UiUtils.dividerLine(),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Languages.of(context)!.howtoCook,
                            style: regularTextStyle(
                                fontSize: 13.0, color: MyColor.black)),
                        InkWell(
                          onTap: () {
                            if (cookController.text.trim().isNotEmpty && cookList.contains(cookController.text.trim()) == false && !isUpdateCook) {
                            cookList.add(cookController.text.trim());
                            }else{
                              cookList[cookIndex] = cookController.text.trim();
                            }
                            isUpdateCook = false;
                            cookController.clear();
                            setState(() {});
                          },
                          child: Text(!isUpdateCook?"${Languages.of(context)!.add}+":Languages.of(context)!.update,
                              style: regularTextStyle(
                                  fontSize: 14.0, color: MyColor.appTheme)),
                        ),
                      ],
                    ),
                    hsized15,
                    commonTextField(
                        cookController,
                        Languages.of(context)!.enterCookYourRecipe.toString(),
                        TextInputAction.done,
                        TextInputType.text,
                        "cook",
                        10,
                        3),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 15, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 08),
                            itemCount: cookList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Step ${(index + 1)} - ",
                                              style: regularTextStyle(
                                                  fontSize: 14.0,
                                                  color: MyColor.appTheme)),
                                          Expanded(
                                            child: Text(cookList[index],
                                                style: regularTextStyle(
                                                    fontSize: 14.0,
                                                    color: MyColor.appTheme)),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                        onTap: (){
                                          cookIndex = index;
                                          setState(() {});
                                          AllDialogs.globalBottomSheet(context,UpdateDeletePopup(onUpdate:onUpdateDeleteCook, text:cookList[index], title: 'How to cook',),(){});
                                        },
                                        child:  Icon(Icons.more_vert,color: MyColor.black,size: 18,)
                                    ),
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

              hsized15,

              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                child: GlobalButton(
                    Languages.of(context)!.add.toString(),
                    MyColor.appTheme,
                    MyColor.appTheme,
                    btnSize55,
                    double.infinity,
                    checkValidation,
                    55,
                    5,
                    0,
                    mediumTextStyle(fontSize: 15.0, color: MyColor.white)),
              ),

              hsized30,
            ],
          ),
        ),
      ),
    );
  }

  onCallBackImage(dynamic file) {
    setState(() {
      selectedImage = File(file.path);
      image = file;
    });
  }

  imgUi(var size) {
    return DottedBorder(
        color: MyColor.liteGray,
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: selectedImage != null ? [200, 0] : const [04, 5],
        child: TouchRippleEffect(
          backgroundColor: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          rippleColor: MyColor.appTheme.withOpacity(0.8),
          onTap: () {
            AllDialogs.globalBottomSheet(context, ImagePickerDialog(onCallBack: onCallBackImage, cropStyle: "rectangle"), () {});
          },
          child: selectedImage != null
              ? Container(
                  height: size.height * 0.19,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: MyColor.yellowF6F1E1,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                          width: size.width
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedImage = null;
                          });
                        },
                        child: Icon(Icons.cancel,color: MyColor.red,),
                      )
                    ],
                  ),
                )
              : Container(
                  // margin: const EdgeInsets.all(2),
                  height: size.height * 0.19,
                  width: size.width * 0.90,
                  decoration: const BoxDecoration(
                    color: MyColor.yellowF6F1E1,
                  ),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(width: 35, height: 35, AssetsPath.addimage),
                      Text(Languages.of(context)!.addImage,
                          style: mediumTextStyle(
                              fontSize: 12.0, color: MyColor.appTheme)),
                    ],
                  ))),
        ));
  }

  commonTextField(
      TextEditingController controller,
      String labelText,
      TextInputAction textInputAction,
      TextInputType textInputType,
      String type,
      int maxLines,
      int minLine) {
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
      child: TextField(
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
        maxLines: maxLines,
        minLines: minLine,
        cursorColor: MyColor.black,
      ),
    );
  }

  void addOnTap() {}

  getRecipeTools(bool load) async {
    await ApiServices.getRecipeTools(context, load).then((onValue) {
      if (mounted) {
        setState(() {
          if (onValue.status == true) {
            if (onValue.data != null) {
              var recipe = onValue.data as List<dynamic>? ?? [];
              recipeToolsList
                  .addAll(recipe.map((r) => RecipeToolsModel.fromJson(r)));
            }
          }
        });
      }
    });
  }

  checkValidation()async{
    if(recipeNameController.text.trim().isEmpty){
      Utility.customToast(context, "Please enter recipe name");
    }
    else if(selectedRecipeToolsList.isEmpty){
      Utility.customToast(context, "Please select recipe tools");
    }else if(ingredientsList.isEmpty){
      Utility.customToast(context, "Please select ingredient");
    }else if(cookList.isEmpty){
      Utility.customToast(context, "Please enter how to cook step");
    }else{
      Future.delayed(Duration.zero,addRecipe);
    }
  }

addRecipe()async{
    AddRecipeRequest addRecipeRequest = AddRecipeRequest(
      recipeName:recipeNameController.text.trim(),
      recipeTools: selectedRecipeToolsList.join(', '),
      ingredients:ingredientsList.join(', '),
      recipeSteps:cookList.join(', ')
    );
    await ApiServices.addRecipe(context, addRecipeRequest, image).then((onValue){
      if(mounted){
        setState(() {

          if(onValue.status == true){
              var data = RecipeModel.fromJson(onValue.data);
            Navigator.pop(context);
            widget.onCallBack(data);
          }

        });
      }
    });
}
onUpdateDeleteIngredient(String type){
  setState(() {
  if(type == "Delete"){
    ingredientsList.removeAt(ingredientsIndex);
  }else{
    isUpdateIngredients = true;
      ingredientsController.text = ingredientsList[ingredientsIndex];
  }
  });
}

  onUpdateDeleteCook(String type){
    setState(() {
      if(type == "Delete"){
        cookList.removeAt(cookIndex);
      }else{
        isUpdateCook = true;
        cookController.text = cookList[cookIndex];
      }
    });
  }

}

class UpdateDeletePopup extends StatelessWidget {
  final Function onUpdate;
  final String text;
  final String title;
  const UpdateDeletePopup({super.key,required this.onUpdate,required this.text,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      bottomSheet: Wrap(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child:  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right:10.0,top: 5),
                        child: Icon(Icons.clear,color: MyColor.liteGray,size: 30,),
                      )
                  ),
                ),
                SizedBox(height: 15),
                Text(title,style:mediumTextStyle(fontSize:18.0, color:MyColor.black),),
                hsized5,
                Text(text,style:mediumTextStyle(fontSize:16.0, color:MyColor.black),),
                hsized30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                          onUpdate("Delete");
                        },
                        child:  Container(
                            padding: EdgeInsets.symmetric(horizontal:25,vertical:8),
                            decoration: BoxDecoration(
                                color: MyColor.red,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text("Delete",style:mediumTextStyle(fontSize:15.0, color:MyColor.white),))
                    ),

                    SizedBox(width: 10),
                    InkWell(
                        onTap: (){
                         Navigator.pop(context);
                         onUpdate("Edit");
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal:25,vertical:8),
                            decoration: BoxDecoration(
                                color: MyColor.appTheme,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text("Edit",style:mediumTextStyle(fontSize:15.0, color:MyColor.white),))
                      //Icon(Icons.edit,color: MyColor.red,size: 18,),
                    )
                  ],
                ),
                hsized30,
              ],
            ),
          )
        ],
      ),
    );
  }
}

