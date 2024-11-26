import 'package:cooking_champs/constant/my_color.dart';
import 'package:flutter/material.dart';

class AllDialogs{

  ///===================== Start Creating new Add popup=====================
  static void globalBottomSheet(BuildContext context, var page,Function update) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        isDismissible: false,
        barrierColor:MyColor.black.withOpacity(0.20),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height *0.9,
            child: page,
          );
        },
      ).then((value) {
        update();
      });
    });
  }

  ///===================== Start Creating new Add popup=====================
  static void bottomPopup(BuildContext context, var page,Function update) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        isDismissible: true,
        barrierColor:MyColor.black.withOpacity(0.20),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: page,
          );
        },
      ).then((value) {
        update();
      });
    });
  }

  static customPopup(BuildContext context, var page) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return  page;
        },
      );
  }

  ///--------------  Loader  -----------------------
  static progressLoadingDialog(BuildContext context, bool status) {
    if (status) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return  Center(
             child:CircularProgressIndicator(color: MyColor.appTheme,)
            // //LoaderView()
            // Image.asset(MyAssetsPaths.loader2,height: 100,width: 100,color: MyColors.appTheme,)

          );
        },
      );
    } else {
      Navigator.pop(context);
    }
  }

  ///----------------------- Alert Dialog -------------------------
  static  void customDialog(BuildContext context, var page) {
    showModalBottomSheet(
      context: context,
      barrierColor: MyColor.black.withOpacity(0.70),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height:  MediaQuery.of(context).size.height,
          child: page,
        );
      },
    ).then((value) {
    });
  }

  ///----------------------- InterNet connectvity Alert Dialog -------------------------
  static  void noInternetDialog(BuildContext context, var page) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return  SizedBox(
          height: 300,
          child: Center(
              child:page
          ),
        );
      },
    ).then((value) => null);
  }

 /// ================== Image BottomSheet ===========================
 static void showBottomsheetUploadImage(BuildContext context, GestureTapCallback cameraOnTap,GestureTapCallback galleryOnTap) {
    showModalBottomSheet(
      context: context,
      backgroundColor:Colors.transparent,
      builder: (BuildContext context) {
        return SizedBox(
          height: 350,
         // child: UiUtils.uploadImageBottomUi(context,cameraOnTap,galleryOnTap),
        );
      },
    );
  }

  /// ================== Alert Dialog ===========================
 static void alertDialog(BuildContext context, var page) {
   showDialog(
       context: context,
       barrierColor: Colors.transparent,
       builder: (_) => AlertDialog(
         backgroundColor: Colors.transparent,
           contentPadding:
           const EdgeInsets.only(
               left: 20,
               right: 20,
               bottom: 15,
               top: 15),
           insetPadding:
           const EdgeInsets.only(
               left: 20,
               right: 20,
               bottom: 15,
               top: 15),
           shape:
           const RoundedRectangleBorder(
               borderRadius:
               BorderRadius.all(
                   Radius.circular(
                       25.0))),
           content:
           Builder(builder: (context) {
             return page;
           })));
  }




  /*static void fullImageOpenDialog2(BuildContext context, String url) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor:Colors.white.withOpacity(0.98),
        insetPadding: const EdgeInsets.symmetric(horizontal: 10),
        elevation: 10,
        shadowColor:Colors.transparent,
        child: SizedBox(
          height: 450,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:PhotoView(
                  backgroundDecoration: const BoxDecoration(
                      color: Colors.transparent
                  ),
                  imageProvider: NetworkImage(url),
                ),
              ),

             // UiUtils.cachedNetworkFullImage2(double.infinity, url),

              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: MyColors.appTheme,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.clear, color: Colors.white, size: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );*/
}

class LoaderView extends StatefulWidget {
  const LoaderView({super.key});

  @override
  State<LoaderView> createState() => _LoaderViewState();
}

class _LoaderViewState extends State<LoaderView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.black.withOpacity(0.10),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            // Use Transform.rotate to rotate the Image based on the animation value
            return Transform.rotate(
              angle: _animation.value,
              // child: Image.asset(
              //  MyAssetsPaths.loader,
              //   width: 150,
              //   height: 150,
              // ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
