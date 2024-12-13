import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/static_model/food_recipe_model.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_activity5_view.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/basic_activity7_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';

String recipeName = "Trail Mix";
// FoodRecipeModel recipe = FoodRecipeModel();
class KidsRecipeView extends StatefulWidget {
  final String recipeName;
  final FoodRecipeModel recipe;
  final Color color;
  final String appBarTitle;

  const KidsRecipeView({super.key,required this.recipeName,required this.recipe,this.color = MyColor.green,required this.appBarTitle});

  @override
  State<KidsRecipeView> createState() => _KidsRecipeViewState();
}

class _KidsRecipeViewState extends State<KidsRecipeView> {


  String activity = "Activity 2.1";
  @override
  void initState() {
    setData();
    super.initState();
  }

  setData(){
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColor.white,
      body: Stack(
        children: [
          Visibility(
            visible: widget.recipeName == "Jelly Fruit cups",
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(AssetsPath.maleFemaleSheff,height:173,width:193,),
            ),
          ),

          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20,top: 45),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UiUtils().foodEnergyAppBar(text:widget.appBarTitle,() => back()),
                    UiUtils.bookReadGirl(widget.color, AssetsPath.sheff)
                  ],
                ),
              ),
              Expanded(
                child:    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiUtils.buildBoldText(widget.recipe.title??"",
                            fontSize: 23.0, color:widget.color),

                        Visibility(
                          visible:widget.recipe.description!.isNotEmpty,
                          child: Padding(padding: EdgeInsets.only(top: 10),
                            child: UiUtils.buildNormalText(widget.recipe.description??"",
                                fontSize: 16.0, color: MyColor.black),),
                        ),
                        //:SizedBox.shrink(),


                        hsized20,
                        Image.asset(
                          widget.recipe.image??"",
                          height: 200,
                          fit: BoxFit.cover,
                        ),

                        hsized30,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:widget.recipe.tools!.map((tool) => Container(
                                alignment: Alignment.center,
                                height:86,
                                width:73,
                                margin:EdgeInsets.only(right:15,left: 5),
                                padding:EdgeInsets.symmetric(horizontal:3),
                                decoration: BoxDecoration(
                                    color: MyColor.white,
                                    borderRadius:BorderRadius.circular(23),
                                    boxShadow:[
                                      BoxShadow(blurRadius:5,color:MyColor.liteGray.withOpacity(0.60))
                                    ]
                                ),
                                child: Image.asset(tool))).toList(),
                          ),
                        ),

                        hsized20,
                        UiUtils.buildBoldText("You Will Need", fontSize: 18.0, color: MyColor.appTheme),

                        hsized10,
                        UiUtils.buildBulletPoints(widget.recipe.ingredients??[],bottomPadding:5),
                        // _buildBulletPoints(recipe.ingredients),

                        hsized20,
                        UiUtils.buildBoldText("How To", fontSize: 18.0, color: MyColor.appTheme),

                        hsized10,
                        UiUtils.buildSteps(widget.recipe.steps??[],bottomPadding:5,step: "step",),

                        recipeName == "Smoothie"?  Container(
                          margin: EdgeInsets.only(top:15),
                          width: double.infinity,
                          decoration:BoxDecoration(
                              color:MyColor.green,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.symmetric(horizontal:15,vertical: 15),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiUtils.buildBoldText("FOR SOMETHING DIFFERENT:",color:MyColor.darkYellow,fontSize:15.0),
                              UiUtils.buildNormalText("Instead of cocoa powder add malt powder or  Replace frozen fruit with fresh fruit and add 3-5 ice cubes while blending and yoghurt in place of milk or Replace milk with almond milk or coconut milk or You may add nuts and seeds of your choice",color:MyColor.white,fontSize:15.0),
                            ],
                          ),
                        ):SizedBox.shrink(),

                        hsized50,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:20.0),
                          child: GlobalButton(recipeName == "Rainbow Soup"?Languages.of(context)!.submit:Languages.of(context)!.next,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
                                  ()=>  setList(),
                              55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white)),
                        ),

                        hsized80,
                        hsized80,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }


/*
  setList() {
    if(recipeName == "Trail Mix"){
      recipeName = "Smoothie";
      CustomNavigators.pushNavigate(KidsRecipeView(recipeName: "Smoothie"), context);
    }else if(recipeName == "Smoothie"){
      recipeName = "Rainbow Soup";
      CustomNavigators.pushNavigate(KidsRecipeView(recipeName: "Rainbow Soup"), context);
    }else if(recipeName == "Rainbow Soup"){
      recipeName = "Trail Mix";
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }
  smoothieList(){
    setState(() {
      activity = "Activity 2.5";
      recipe = FoodRecipeModel(
        title: "Recipe: Healthy Fruity Breakfast Smoothie",
        description:"Smoothies are great for a boost of energy and here’s one to start your day",
        image:AssetsPath.smoothie, // Example image path
        tools:[
          AssetsPath.blender,
          AssetsPath.spoon,
          AssetsPath.mug,
          AssetsPath.tallGlass
        ] ,
        ingredients: [
          "1 Frozen Banana ( Peel and slice the banana before freezing)",
          "5 frozen strawberries ( Hull the strawberries before freezing)",
          "1 cup milk",
          "1 tsp. Cocoa Powder",
          "1 tsp Honey",
        ],
        steps: [
          "Place the banana and strawberries into the blender.",
          "Pour in milk, cocoa powder and honey.",
          "Place the lid on the blender and mix using a high-speed setting.",
          "Pour in a tall glass and enjoy!",
        ],
      );
    });
  }

  trailMix(){
    setState(() {
      // recipeName = widget.recipeName;
      activity = "Activity 2.1";
      recipe = FoodRecipeModel(
        title: "Recipe: Cooking Champs energy sustaining Carry to school Trail Mix",
        description: "",
        image:AssetsPath.mixNuts, // Example image path
        tools:[
          AssetsPath.bowlImg,
          AssetsPath.spoon,
          AssetsPath.mug,
          AssetsPath.pot
        ] ,
        ingredients: [
          "1/2 cup raw cashews",
          "3/4 cup raw almonds",
          "1/2 cup raw sunflower seeds",
          "1/2 cup raw pumpkin seeds",
          "1/2 cup unsweetened raisins",
          "1/3 cup shaved dried coconut",
          "1/2 cup chopped dried apples or apricots",
          "1/2 cup chopped dark chocolate (70% or greater)",
          "1/2 tsp cinnamon",
          "Pinch of nutmeg",
          "Makes 4-5 cups",
        ],
        steps: [
          "Combine all ingredients in a large bowl and mix well.",
          "Store in an air-tight jar. Or you can store 1/4 cup of the trail mix in small air-tight containers and take as a snack pouch in your bag.",
          "Will keep for up to 1 month.",
        ],
      );
    });
  }

  rainbowSoup(){
    setState(() {
      // recipeName = widget.recipeName;
      //recipeName = "Rainbow Soup";
      activity = "Activity 2.5";
      recipe = FoodRecipeModel(
        title: "Recipe: Nonna’s Minestrone Soup - A Rainbow in a Bowl",
        description: "",
        image: AssetsPath.rainbowSoup, // Example image path
        tools: [
          AssetsPath.blender,
          AssetsPath.spoon,
          AssetsPath.mug,
          AssetsPath.pot,
        ],
        ingredients: [
          "1/4 cup olive oil",
          "2 large cloves of garlic, minced",
          "1 onions diced",
          "2 carrots, cleaned and diced/sliced",
          "1 stalk celery plus leaves, cleaned and diced/sliced to 1½ cups total",
          "1 cups fresh green beans,",
          "1 can tomatoes OR use the same amount of fresh tomatoes, if available",
          "1 potato medium size,",
          "2 zucchini, diced with skin left on",
          "1 cup fresh spinach chopped",
          "1 cups fresh cabbage, chopped",
          "1 can cannellini beans, drained and rinsed well",
          "1 can dark red kidney beans, drained and rinsed well",
          "1/2 bunch fresh continental parsley, stems removed and chopped (makes about 1/2 cup)",
          "5 fresh sage leaves chopped",
          "1 chunk of parmesan rind about 2 cm x 2 cm piece (scrape rind)",
          "1 litre water",
          "Salt",
          "Pepper",
          "1/2 cups small dry pasta",
          "1 teaspoon dried thyme",
          "freshly grated Parmesan cheese for serving"
        ],
        steps: [
          "Dice onions, carrot, celery, potato, zucchini",
          "Chop spinach, cabbage, parsley, sage, garlic",
          "Cut fresh green beans in centimetre pieces.",
          "Drain and rinse Cannellini and kidney beans",
          "Pour the olive oil into the pot",
          "Add the chopped onions and minced garlic and dry thyme, cook until clear (careful not to burn the garlic!)",
          "Add the carrots, celery, potatoes, chopped zucchini, the green beans, spinach and cabbage.",
          "Stir all ingredients well",
          "Add the tomatoes and water.",
          "Add the cannellini, and kidney beans",
          "Add a chunk of parmesan cheese",
          "Pour over water"
              "When the soup begins to boil add dry pasta season with salt and pepper"
              "Simmer until all the vegetables are soft .",
          "Serve with fresh bread and sprinkle with freshly grated parmesan cheese .",
        ],
      );

    });
  }
*/

  back() {
    // setState(() {
    //   if(recipeName == "Smoothie"){
    //     debugPrint("Smoothie$recipeName");
    //     recipeName = "Trail Mix";
    //   }else if(recipeName == "Rainbow Soup"){
    //     recipeName = "Smoothie";
    //   }
    // });
    Navigator.pop(context);

  }

  setList() {
    if(widget.recipeName == "Punjab Sweet Lassi"){
      CustomNavigators.pushNavigate(BasicActivity5View(), context);
    }else if(widget.recipeName == "Jelly Fruit cups"){
      setState(() {
        tropoJellyData();
      });
      CustomNavigators.pushNavigate(KidsRecipeView(recipeName: "Tropo Jelly", recipe:recipeModel, appBarTitle:"Activity 4.6",color:MyColor.purple), context);
    }else if(widget.recipeName == "Tropo Jelly"){
      CustomNavigators.pushNavigate(BasicActivity7View(), context);
    }
  }
}

FoodRecipeModel recipeModel =  FoodRecipeModel();
sweetLassiData(){
  recipeModel = FoodRecipeModel(
    title: "Recipe: Sweet Lassi",
    description: "",
    image: AssetsPath.sweetLassi, // Replace with actual image path
    tools: [
      AssetsPath.bowlImg, // Example tools
      AssetsPath.spoon,
      AssetsPath.knife,
      AssetsPath.cutterBoard,
    ],
    ingredients: [
      "3 cups of natural yogurt (chilled)",
      "3/4 cup milk (chilled)",
      "1/2 cup water",
      "Pitted dates 10-12",
      "Honey 2 tsp.",
      "5-7 Pistachios (optional)",
      "Green cardamom powder – ½ tbsp.",
      "Dried rose petals 1 tbsp. (optional)",
    ],
    steps: [
      "Chop the dates and soak in a bowl of warm water for 10-15 minutes.",
      "Whisk the yogurt, milk, water, ½ tbsp. of ground cardamom, and honey (or blend them).",
      "Ask an adult to help. Pull dates out of water, put them in a grinder, and make a paste.",
      "Add the date paste to the yogurt mix and whisk it (or mix it in a blender).",
      "Pour into glasses and garnish with a pinch of cardamom, chopped pistachios, and rose petals. Serve chilled.",
    ],
  );
}

fruitCupsData(){
  recipeModel = FoodRecipeModel(
    title: "Recipe: Happy Belly Berry Jelly Fruit Cups",
    description: "",
    image: AssetsPath.fruitCups, // Replace with actual image path
    tools: [
      AssetsPath.bowlImg, // Example tools
      AssetsPath.spoon,
      AssetsPath.knife,
      AssetsPath.cutterBoard,
    ],
    ingredients: [
      "2x250g punnets strawberries",
      "1/2 cup blueberries",
      "1/2 cup water",
      "2 tbsp. Agar Agar (8 gm)",
      "2 cups clear unsweetened apple juice",
      "1/4 cup caster sugar",
    ],
    steps: [
      "Wash 1 punnet of strawberries. Hull, and roughly chop. Place into a food processor or blender and blend until smooth. Strain the juice into a jug and set aside. Discard the strawberry pulp.",
      "Combine the water and apple juice in a medium saucepan. Then ask an adult to help place on medium heat. Cook, stirring for 2-3 minutes or until liquid is warm. Add the strawberry juice, blueberries, and sugar. Heat over medium heat for 5 minutes until the liquid just comes to a simmer.",
      "Add 2 tbsp. of Agar Agar to the mixture. Cook, stirring constantly for 15 minutes, or until the liquid is slightly thickened.",
      "Wash blueberries and remaining strawberries. Hull and dice the strawberries. Place a few berries into clear serving cups. Pour jelly over berries. Cover and refrigerate for a further 4 hours or until completely set.",
    ],
  );
}

tropoJellyData(){
  recipeModel = FoodRecipeModel(
    title: "Recipe: Going Tropo for Jelly!",
    description: "",
    image: AssetsPath.tropoJelly, // Replace with actual image path
    tools: [
      AssetsPath.bowlImg, // Example tools
      AssetsPath.spoon,
      AssetsPath.knife,
      AssetsPath.cutterBoard,
    ],
    ingredients: [
      "3-4 strawberries",
      "!/2 cup blueberries",
      "1/2 cup water",
      "2 tbsp. Agar Agar ( 8 gm)",
      "2 cups clear unsweetened apple juice",
      "1/4 cup caster sugar",
    ],
    steps: [
      "Wash 1 punnet of strawberries. Hull, and roughly chop. Place into a food processor or blender, and blend until smooth. Strain the juice into a jug and set aside. Discard the strawberry pulp.",
      "Combine the water and gelatine in a medium saucepan then ask an adult to help place over medium heat. Cook, stirring for 2-3 minutes or until the liquid is warm. Add the strawberry juice, apple juice and sugar. Heat over medium heat for 5 minutes until the liquid just comes to the simmer.",
      "Ask an adult to help transfer the mixture to a bowl. Set aside to cool for 30 minutes. Cover and refrigerate for 15 minutes or until jelly is cold.",
      "Wash blueberries and remaining strawberries. Hull and slice the strawberries. Place berries into the base of six glasses. Pour jelly over berries. Cover and refrigerate for a further 4 hours or until completely set. Serve.",
    ],
  );
}