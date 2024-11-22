import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/enums/register_enum.dart';
import 'package:cooking_champs/model/dynamic_models/friend_model.dart';
import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';
import 'package:cooking_champs/model/post_model/friend_accept_reject_request.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class FriendRequestView extends StatefulWidget {
  const FriendRequestView({super.key});

  @override
  State<FriendRequestView> createState() => _FriendRequestViewState();
}

class _FriendRequestViewState extends State<FriendRequestView>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late final TabController tabController;
  List<dynamic> filteredList = [];
  List<String> tabItemList = [];
  List<FriendsModel> myFriendsList = [];
  List<UserIdentityModel> userList = [];
  UserIdentityModel senderDetail = UserIdentityModel();
  FriendsModel friendsModel = FriendsModel();
  dynamic isFocusColor = '';

  String myFriend = "";
  String request = "";
  String searchFriends = "";
  String requestId = "";
  String accept = "";


  bool isLoading = false;
  bool hasMoreData = true;

  int totalPage = 1;
  int page = 1;
  int tabIndex = 0;


  @override
  void initState() {
    setTabItem();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: tabItemList.length,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: size.width * 0.08,
          automaticallyImplyLeading: false,
          backgroundColor: MyColor.yellowF6F1E1,
          surfaceTintColor: MyColor.yellowF6F1E1,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
              radius: 80,
              onTap: () {
                setState(() {
                  isTabExplore = false;
                });
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(Languages.of(context)!.friendRequest,
                style: mediumTextStyle(fontSize: 18.0, color: MyColor.black)),
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: Column(
          children: [
            TabBar(
              dividerColor: MyColor.colorE5E9F4,
              indicatorColor: MyColor.appTheme,
              controller: tabController,
              onTap: (value) {
                setState(() {
                  myFriendsList.clear();
                  filteredList.clear();
                  searchController.clear();
                   isLoading = false;
                   hasMoreData = true;
                  tabIndex = tabController.index;
                });
                Future.delayed(Duration.zero, () {
                  getFriendsRequest(false);
                });
              },
              tabs: List.generate(tabItemList.length, (index) {
                return UiUtils.tabItem(context, size, tabItemList[index]);
              }),
            ),
            hsized15,
            Container(
              alignment: Alignment.center,
              height: 55,
              margin: const EdgeInsets.fromLTRB(12, 5, 12, 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isFocusColor == "firstName" ? MyColor.colorD8DCE4 : MyColor.grayLite,
                ),
                color: const Color.fromARGB(255, 237, 239, 241),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
              child: TextField(
                controller: searchController,
                textCapitalization: TextCapitalization.sentences,
                onTap: () {
                  setState(() {
                    isFocusColor = "firstName";
                  });
                },
                onChanged: (value) => filterList(value),
                style: regularTextStyle(fontSize: 14.0, color: MyColor.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: Languages.of(context)!.searchByName.toString(),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: IconButton(
                      icon: Icon(Icons.search, color: MyColor.black, size: 35,),
                      onPressed: () {},
                    ),
                  ),
                  hintStyle: regularTextStyle(
                    fontSize: 14.0,
                    color: MyColor.grayLite1,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.only(top: 10),
                ),
                cursorColor: MyColor.black,
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  myFriendsUi(size),
                  requestUi(size),
                  searchFriendsUi(size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setTabItem() {
    tabItemList = ["My Friends", "Request", "Search Friends"];
    tabController = TabController(vsync: this, length: tabItemList.length);
    Future.delayed(Duration.zero, () {
      getFriendsRequest(true);
    });
  }

  myFriendsUi(var size) {
    return myFriendsList.isNotEmpty ?
    listView()
        :SizedBox.fromSize();
  }

  requestUi(Size size) {
    return  myFriendsList.isNotEmpty ?
    listView()
        :SizedBox.fromSize();
  }


  searchFriendsUi(Size size) {
    return userList.isNotEmpty ?
    listView()
        :SizedBox.fromSize();
  }


  listView(){
    final isSearchTab = tabIndex == 2;
    final currentList = isSearchTab ? userList : myFriendsList;

    return  NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            !isLoading &&
            totalPage >= page) {
          Future.delayed(Duration.zero, () {
           // getFriendsRequest(false);
          });
        }
        return false;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            searchController.text.trim().isNotEmpty && filteredList.isNotEmpty?
        ListView.builder(
        padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredList.length,
          itemBuilder: (BuildContext context, index) {
            final senderDetail = filteredList[index];
            return UiUtils.friendRequestUi(
              senderDetail.name ?? "",
              senderDetail.role == RegisterType.roleKids.value
                  ? "${senderDetail.day ?? ""} | ${senderDetail.month ?? ""} | ${senderDetail.year ?? ""} | ${senderDetail.grade ?? ""}"
                  : "",
              senderDetail.image != null
                  ? ApiPath.imageBaseUrl + senderDetail.image.toString()
                  : "",
              tabIndex == 0
                  ? "My Friends"
                  : tabIndex == 1
                  ? "Request"
                  : "Search Friends",
              (v){
                friendsModel = filteredList[index];
                requestId = filteredList[index].id??"";
                acceptRejectOnCallBack(v);}
           ,
            );
          },
        )
            :
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:tabIndex == 2 ?userList.length:myFriendsList.length,
              itemBuilder: (BuildContext context, index) {
                if(tabIndex == 2){
                  senderDetail = userList[index];
                }
                   else if(myFriendsList.isNotEmpty && myFriendsList[index].senderDetail != null){
                      senderDetail = myFriendsList[index].senderDetail!;
                }
                return UiUtils.friendRequestUi(
                    senderDetail.name ?? "",
                    senderDetail.role == RegisterType.roleKids.value?
                    "${senderDetail.day??""} | ${senderDetail.month??""} | ${senderDetail.year??""} | ${senderDetail.grade??""}" :"",
                    senderDetail.image != null ? ApiPath.imageBaseUrl + senderDetail.image.toString() : "",
                   tabIndex == 0? "My Friends": tabIndex == 1? "Request":"Search Friends",
                        (v){
                          friendsModel = myFriendsList[index];
                      requestId = myFriendsList[index].id??"";
                      acceptRejectOnCallBack(v);});
              },
            ),

            loader(),
            hsized40,
          ],
        ),
      ),
    );
  }

  loader(){
   return isLoading
        ? Container(
        margin: EdgeInsets.only(top: 20, bottom: 80),
        height: 50,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: MyColor.appTheme,
        ))
        : SizedBox.shrink();
  }

  acceptRejectOnCallBack(String acceptStatus){
    setState(() {
      if(acceptStatus == "Accept"){
        accept = "yes";
      }else{
        accept = "no";
      }
    });
   // acceptReject();
    Future.delayed(Duration.zero,acceptReject);

  }

  acceptReject() async{

    FriendAcceptRejectRequest acceptRejectRequest = FriendAcceptRejectRequest(
      friendRequestId: int.parse(requestId),
      accept: accept,
    );
    debugPrint("acceptStatus...${acceptRejectRequest.accept}");

    await ApiServices.acceptRejectFriendsRequest(context, acceptRejectRequest, true).then((onValue){
      if(onValue.status == true){
        if(mounted){
          setState(() {
            accept = "Accept";
            myFriendsList.remove(friendsModel);
          });
        }
      }
    });
  }

  void filterList(String query) {
    List<dynamic> originalList = tabIndex == 2 ? userList : myFriendsList;
    if (query.isEmpty) {
      setState(() {
        filteredList = originalList;
      });
    } else {
      setState(() {
        filteredList = originalList.where((item) {
          String name = item.name?.toLowerCase() ?? "";
          return name.contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  Future<void> getFriendsRequest(bool load) async {
    if (isLoading || !hasMoreData) return;

    String type = ["accepted", "pending", "all"][tabController.index];

    setState(() {
      isLoading = true; // Start loading
    });
    try {
      var onValue = await ApiServices.getFriendsRequest(context, page, load, type);
      if (!mounted || onValue.status != true) return;

      setState(() {
        var items = (onValue.data as List<dynamic>?) ?? [];
        if (page == 1) myFriendsList.clear(); // Clear the list only on the first page
        if (page == 1) userList.clear(); // Clear the list only on the first page

        if (items.isNotEmpty) {
          dynamic friends = tabIndex == 2
              ? items.map((item) => UserIdentityModel.fromJson(item)).toList()
              : items.map((item) => FriendsModel.fromJson(item)).toList();
          if (tabIndex == 2) {
            userList.addAll(friends);
            userList.sort((a, b) => a.name!.compareTo(b.name!));

          } else {
            myFriendsList.addAll(friends);
            myFriendsList.sort((a, b) => a.senderDetail!.name!.compareTo(b.senderDetail!.name!));
          }
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


  Future<void> getFriendsRequest1(bool load) async {
    String type = tabController.index ==0 ? "accepted":tabController.index ==1 ?"pending":"all";
    if (isLoading || !hasMoreData) return;
    setState(() {
      isLoading = true; // Start loading
    });
    try {
      var onValue = await ApiServices.getFriendsRequest(context, page, load,type);
      if (mounted && onValue.status == true) {
        setState(() {
          var items = onValue.data as List<dynamic>? ?? []; // Safely cast items to List<dynamic>
            myFriendsList.clear(); // Clear the list only on the first page
          if (items.isNotEmpty) {
            if(tabIndex == 2){
              var friends = items.map((item) => UserIdentityModel.fromJson(item)).toList();
              friends.sort((a, b) => b.id!.compareTo(a.id!));
              userList.addAll(friends);
              debugPrint("items...$items");
            }
            else{
              var friends = items.map((item) => FriendsModel.fromJson(item)).toList();
              friends.sort((a, b) => b.id!.compareTo(a.id!));
              myFriendsList.addAll(friends);
            }

          } else {
            hasMoreData = false; // No more data to load
          }
        });
      }
    } catch (e) {
      debugPrint('Error fetching stories: $e');
    } finally {
      setState(() {
        isLoading = false; // End loading
      });
    }
  }
}
