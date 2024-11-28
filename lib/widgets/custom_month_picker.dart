import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';

class CustomMonthPicker extends StatefulWidget {
  final int? currentMonthIndex;
  final Function(String) onMonthSelected;

  const CustomMonthPicker(
      {super.key, required this.onMonthSelected, this.currentMonthIndex});

  @override
  State<CustomMonthPicker> createState() => _CustomMonthPickerState();
}

class _CustomMonthPickerState extends State<CustomMonthPicker> {
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  late int currentMonthIndex; // Current month index
  int? selectedMonthIndex; // Selected month index

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    if (widget.currentMonthIndex != null) {
      currentMonthIndex = widget.currentMonthIndex! - 1;
    } else {
      currentMonthIndex = now.month - 1; // Get current month (0-based index)
    }

    selectedMonthIndex = currentMonthIndex; // Auto-select current month
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: MyColor.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Select Month',
                  style:
                      semiBoldTextStyle(fontSize: 18.0, color: MyColor.black),
                ),
              ),
              UiUtils.dividerLine(),
              GridView.builder(
                padding: const EdgeInsets.only(
                    top: 15, left: 10, right: 10, bottom: 20),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 columns
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 2, // Adjust for better button appearance
                ),
                itemCount: months.length,
                itemBuilder: (context, index) {
                  final isCurrentMonth = index == currentMonthIndex;
                  final isSelected = index == selectedMonthIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMonthIndex = index; // Update selected month
                      });

                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? MyColor.appTheme
                            : isCurrentMonth
                                ? MyColor.appTheme.withOpacity(0.2)
                                : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(months[index],
                          style: regularTextStyle(
                              fontSize: 15.0,
                              color: isSelected || isCurrentMonth
                                  ? Colors.white
                                  : Colors.black)),
                    ),
                  );
                },
              ),

             // hsized10,

              UiUtils.dividerLine(),
              hsized15,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GlobalButton("Ok",MyColor.appTheme,MyColor.white,btnSize50,60,okOnTap,10,0,0,mediumTextStyle(fontSize:18.0, color:MyColor.white)),
                  SizedBox(width:15),
                  GlobalButton("Cancel",MyColor.red,MyColor.white,btnSize50,100,cancelOnTap,10,0,0,mediumTextStyle(fontSize:18.0, color:MyColor.white)),
                  SizedBox(width: 20,),
                ],
              ),


              hsized15,
            ],
          ),
        ),
      ],
    );
  }
  void okOnTap() {
    widget.onMonthSelected('${selectedMonthIndex! + 1}'
        .padLeft(2, '0')); // Callback with selected month
    Navigator.of(context).pop();
  }

  void cancelOnTap() {
    Navigator.of(context).pop(); // Close dialog
  }
}

class CustomYearPicker extends StatefulWidget {
  final Function(int) onYearSelected;

  const CustomYearPicker({super.key, required this.onYearSelected});

  @override
  State<CustomYearPicker> createState() => _CustomYearPickerState();
}

class _CustomYearPickerState extends State<CustomYearPicker> {
  late int currentYear; // The current year
  int? selectedYear; // The selected year
  final int startYear = 1850; // Starting year

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    currentYear = now.year; // Get the current year
    selectedYear = currentYear; // Auto-select the current year
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: MyColor.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            hsized10,

             Text(
               'Select Year',
               textAlign: TextAlign.center,
               style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
             ),
            hsized15,
            UiUtils.dividerLine(),
            hsized10,

            SizedBox(
              height:230,
              child: GridView.builder(
                reverse: true,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left:20.0,right:20.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:5, // Number of columns
                  mainAxisSpacing:2,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.5, // Adjust for year buttons
                ),
                itemCount: currentYear - startYear + 1,
                // Total number of years
                itemBuilder: (context, index) {
                  final year = startYear + index;
                  final isCurrentYear = year == currentYear;
                  final isSelected = year == selectedYear;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedYear = year; // Update selected year
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? MyColor.appTheme : isCurrentYear ?MyColor.appTheme.withOpacity(0.2) : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                      child: Text(year.toString(),
                          style: mediumTextStyle(
                              fontSize: 16.0,
                              color: isSelected || isCurrentYear
                                  ? MyColor.white
                                  : Colors.black)
                          ),
                    ),
                  );
                },
              ),
            ),
            hsized10,

            UiUtils.dividerLine(),
            hsized10,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GlobalButton("Ok",MyColor.appTheme,MyColor.white,btnSize50,60,okOnTap,10,0,0,mediumTextStyle(fontSize:18.0, color:MyColor.white)),
                SizedBox(width:15),
                GlobalButton("Cancel",MyColor.red,MyColor.white,btnSize50,100,cancelOnTap,10,0,0,mediumTextStyle(fontSize:18.0, color:MyColor.white)),
                SizedBox(width: 20,),
              ],
            ),


            const SizedBox(height:10),
          ],
        ),
      )
    ]);
  }

  void okOnTap() {
    widget.onYearSelected(selectedYear!); // Callback with selected year
    Navigator.of(context).pop(); // Close dialog
  }

  void cancelOnTap() {
    Navigator.of(context).pop(); // Close dialog
  }
}
