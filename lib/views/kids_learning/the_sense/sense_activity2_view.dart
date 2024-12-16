import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/static_model/food_model.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/kids_recipe_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class SenseActivity2View extends StatefulWidget {
  const SenseActivity2View({super.key});

  @override
  State<SenseActivity2View> createState() => _SenseActivity2ViewState();
}

int currentPage = 0;

class _SenseActivity2ViewState extends State<SenseActivity2View> {
  final PageController _pageController = PageController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
   List<FoodModel> foodList = [];
   List<String> tasteList = [];
   @override
  void initState() {
  setState(() {
    foodList = foodModels();
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            hsized35,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.hygieneAppBar(() => Navigator.pop(context),
                    text: "Activity 5.2", color: MyColor.black),
                UiUtils.bookReadGirl(MyColor.red1, AssetsPath.senseAppbarImage)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.buildBoldText("Taste Test",
                    color: MyColor.red1, fontSize: 23.0),
                UiUtils.buildMediumText(
                  "${currentPage + 1}/2",
                  color: MyColor.black,
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: onPageChanged,
                children: [
                  buildPage1(),
                  buildPage2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void onPageChanged(int value) {
    setState(() {
      currentPage = value;
    });
  }

  buildPage1() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hsized8,
          UiUtils.buildNormalText("You will work in pairs"),
          hsized2,
          UiUtils.buildParagraph("", "You will need : ",
              "1 lemon peeled and cut into segments, honey (placed on teaspoons), salt, orange segmented, apple cut into slices, banana (cut in 2cm pieces), 70-85% dark chocolate small pieces blind fold (1 per pair), teaspoons, paper plates (1 per pair)",
              color: MyColor.darkSky),
          hsized10,
          UiUtils.buildSemiBoldText("Experiment",
              color: MyColor.darkSky, fontSize: 16.0),
          UiUtils.buildSteps([
            "Each group collect 2 pieces of each sample foods.",
            "One partner is blindfolded.",
            "Person without blindfold carefully feeds blindfolded person.",
            "Blindfolded person describes flavour of each sample and which senses they are using.",
            "Partner without blindfold ticks box with flavours and senses used.",
            "When you have tried all samples swap and do the experiment again."
          ]),
          Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () => _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut),
              child: Text('Start Taste Test'),
            ),
          ),
        ],
      ),
    );
  }

  buildPage2() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hsized20,
          Table(
            border: TableBorder.all(color: Colors.red, width:1.5),
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
            },
            children: [
              // Header Row
              TableRow(
                children: [
                  _buildTableHeader('SAMPLE',MyColor.red1),
                  _buildTableHeader('BITTER',MyColor.sky),
                  _buildTableHeader('SOUR',MyColor.pink),
                  _buildTableHeader('SWEET',MyColor.purple),
                ],
              ),
              // Rows for each food sample
              ...foodList.map((sample) => _buildTableRow(sample)),
            ],
          ),
          hsized10,

          UiUtils.buildBoldText("Did you get any surprises? YES/NO",fontSize:16.0),

          hsized10,
          surpriseQue("If yes what were they?",controller1),
          hsized3,
          surpriseQue("If yes what were they?",controller2),
          hsized3,
          surpriseQue("If yes what were they?",controller3),
          hsized30,
          GlobalButton(Languages.of(context)!.submit,MyColor.red1,MyColor.red1,btnSize55,double.infinity,_submitResults,55,0,0,mediumTextStyle(fontSize:18.0, color:MyColor.white)),
         hsized50
        ],
      ),
    );
  }




  void _submitResults() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Results'),
        content: SingleChildScrollView(
          child: Column(
            children:List.generate(tasteList.length, (int index){
              return Text(
                '$index: ${tasteList[index]}',
              );
            })
          ),
        ),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
              // basilPestoData();
              // CustomNavigators.pushNavigate(KidsRecipeView(recipeName:"Basil Pesto", recipe: recipeModel, appBarTitle:"Activity 5.3",color:MyColor.red1,), context);
            },
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
  // Widget for Table Header with custom color
  Widget _buildTableHeader(String text, Color color) {
    return Container(
      height: 40,
      color: color,
      padding: const EdgeInsets.all(8.0),
      child: Center(child: UiUtils.buildMediumText(text, color: MyColor.white,fontSize:15.0)),
    );
  }


  // Widget for Table Row
  TableRow _buildTableRow(FoodModel sample) {
    return TableRow(
      children: [
        _buildSampleCell(sample),
        _buildTasteCell(sample, 'Bitter'),
        _buildTasteCell(sample, 'Sour'),
        _buildTasteCell(sample, 'Sweet'),
      ],
    );
  }

  // Widget for Sample Cell with Image
  Widget _buildSampleCell(FoodModel sample) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(sample.imagePath,
              width: 40, height: 40, fit: BoxFit.cover),
        ],
      ),
    );
  }

  Widget _buildTasteCell(FoodModel sample, String taste) {
    return InkWell(
      onTap: () {
        _selectTaste(sample, taste);
        if(_getTasteValue(sample, taste) && !tasteList.contains(sample.name) && !tasteList.contains(taste)){
          tasteList.add("$taste: ${sample.name}");
        }
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Icon(
          Icons.check,
          color: _getTasteValue(sample, taste) ? Colors.green : Colors.transparent,
          size: 24,
        ),
      ),
    );
  }

  // Method to select one taste and deselect others
  void _selectTaste(FoodModel sample, String selectedTaste) {
    setState(() {
      sample.isBitter = selectedTaste == 'Bitter';
      sample.isSour = selectedTaste == 'Sour';
      sample.isSweet = selectedTaste == 'Sweet';
    });
    print("Selected Taste for ${sample.name}: Bitter=${sample.isBitter}, Sour=${sample.isSour}, Sweet=${sample.isSweet}");
  }

  // Get Taste Value
  bool _getTasteValue(FoodModel sample, String taste) {
    switch (taste) {
      case 'Bitter':
        return sample.isBitter;
      case 'Sour':
        return sample.isSour;
      case 'Sweet':
        return sample.isSweet;
      default:
        return false;
    }
  }

  surpriseQue(String text,TextEditingController controller){
    return Row(
      children: [
      UiUtils.buildNormalText(text),
        Expanded(child: textField(controller))
      ],
    );
  }

  textField(TextEditingController controller){
    return Stack(
      children: [
        for (int i = 0; i < 1; i++)
          Container(
            margin: EdgeInsets.only(
              top: 4 + (i + 1) * 17,
            ),
            decoration: const BoxDecoration(
              border: DashedBorder(
                dashLength: 5,
                left: BorderSide.none,
                top: BorderSide.none,
                right: BorderSide.none,
                bottom: BorderSide(color: Colors.black, width: 1),
              ),
            ),
          ),
        SizedBox(
          height:18,
          child: TextField(
            controller:controller,
            scrollPhysics: NeverScrollableScrollPhysics(),
            decoration: InputDecoration(border: InputBorder.none,),
            cursorHeight:12,
            onTapOutside: (v){
              FocusManager.instance.primaryFocus!.unfocus();
            },
            style: TextStyle(
              fontSize:15.0,
            ),
            keyboardType: TextInputType.text,
            // expands: true,
            maxLines:1,
          ),
        ),
      ],
    );
  }


}


