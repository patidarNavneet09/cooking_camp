import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/enums/register_enum.dart';
import 'package:cooking_champs/model/dynamic_models/friend_model.dart';
import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShareStoryView extends StatefulWidget {
  const ShareStoryView({super.key});

  @override
  State<ShareStoryView> createState() => _ShareStoryViewState();
}

class _ShareStoryViewState extends State<ShareStoryView> {
  List<FriendsModel> myFriendsList = [];
  UserIdentityModel senderDetail = UserIdentityModel();
  FriendsModel friendsModel = FriendsModel();

  String myFriend = "";
  String request = "";
  String requestId = "";
  String accept = "";


  bool isLoading = false;
  bool hasMoreData = true;

  int totalPage = 1;
  int page = 1;
  int tabIndex = 0;
  bool isCheck = false;
  int id = 0;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      getFriendsRequest(true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: IntrinsicHeight(
          child:Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColor.white,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight:Radius.circular(15))
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top:10,bottom: 10),
                        width: 120,
                        height:5,
                        decoration: BoxDecoration(
                          color: MyColor.liteGray,
                          borderRadius:BorderRadius.circular(5)
                        ),
                      ),
                    ),
                
                    Text(Languages.of(context)!.share,style: mediumTextStyle(fontSize:20.0, color:MyColor.black),),
                
                    Container(
                      padding: EdgeInsets.only(top:10),
                      child:UiUtils.dividerLine() ,
                    ),
                
                    Container(
                      alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top:10,left: 20),
                        child: Text(Languages.of(context)!.tapToSelectAndShare,style: regularTextStyle(fontSize:15.0, color:MyColor.black),)),
                
                    hsized10,

                    myFriendsList.isNotEmpty?
                    Column(
                      children:List.generate(myFriendsList.length, (int index){
                        return friendsCard(index,myFriendsList[index]);
                      }),
                    ) : SizedBox.shrink(),

                    hsized100,


                  ],
                ),
              ),
            ),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        alignment: Alignment.bottomCenter,
        child: GlobalButton("Share Now",MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,shareOnTap,55,5,0,mediumTextStyle(fontSize:16.0, color:MyColor.white)),
      ),
    );
  }
  friendsCard(int index,FriendsModel model){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical:8),
          padding: EdgeInsets.symmetric(horizontal:10,vertical:8),
          decoration: BoxDecoration(
            color: MyColor.white,
            border: Border.all(color: MyColor.appTheme,width: 1),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: UiUtils.networkProfile(60,60,model.senderDetail!.image != null? ApiPath.imageBaseUrl+ model.senderDetail!.image.toString():""),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                Text("${model.senderDetail!.name}",style: mediumTextStyle(fontSize:16.0, color:MyColor.black),),

                      model.senderDetail!.role == RegisterType.roleKids.value ?
                Text("${model.senderDetail!.day} | ${model.senderDetail!.month} | ${model.senderDetail!.year} | ${model.senderDetail!.grade}",style:regularTextStyle(fontSize:14.0, color:MyColor.black),)
                          :SizedBox.shrink()
              ],
                  )),

              InkWell(
                onTap: (){
                  setState(() {
                    isCheck = !isCheck;
                    id = index;
                  });
                },
                child: SvgPicture.asset(id == index &&isCheck?AssetsPath.fillCheck:AssetsPath.check),
              )
            ],
          ),
        ),

        index == 9 ? hsized100:SizedBox.shrink()
      ],
    );
  }

  void shareOnTap() {
  }

  Future<void> getFriendsRequest(bool load) async {
    if (isLoading || !hasMoreData) return;

    String type = "accepted";

    setState(() {
      isLoading = true; // Start loading
    });
    try {
      var onValue = await ApiServices.getFriendsRequest(context, page, load, type);
      if (!mounted || onValue.status != true) return;

      setState(() {
        var items = (onValue.data as List<dynamic>?) ?? [];
       myFriendsList.clear(); // Clear the list only on the first page

        if (items.isNotEmpty) {
          var friends = items.map((item) => FriendsModel.fromJson(item)).toList();

            myFriendsList.addAll(friends);
            myFriendsList.sort((a, b) => a.senderDetail!.name!.compareTo(b.senderDetail!.name!));
        } else {
          hasMoreData = false; // No more data to load
        }
      });
    } catch (e) {
      debugPrint('Error fetching friends request: $e');
    } finally {
      setState(() {
        isLoading = false; // End loading
      });
    }
  }
}
