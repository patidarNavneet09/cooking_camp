import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class CustomMonthPicker extends StatefulWidget {
  final  int? currentMonthIndex;
  final Function(String) onMonthSelected;

  const CustomMonthPicker({super.key, required this.onMonthSelected, this.currentMonthIndex});

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
    if(widget.currentMonthIndex != null){
      currentMonthIndex = widget.currentMonthIndex!-1;
    }else{
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
              color: MyColor.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Wrap(
            children: [
               Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Select Month',
                  style:semiBoldTextStyle(fontSize:18.0, color:MyColor.black),
                ),
              ),

              UiUtils.dividerLine(),

              GridView.builder(
                padding: const EdgeInsets.only(top: 15,left:10,right: 10,bottom: 20),
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
                      widget.onMonthSelected('${index + 1}'.padLeft(2, '0')); // Callback with selected month
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ?MyColor.appTheme
                            : isCurrentMonth
                            ? MyColor.appTheme.withOpacity(0.2)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        months[index],
                        style: regularTextStyle(fontSize:15.0, color:isSelected || isCurrentMonth
                            ? Colors.white
                            : Colors.black)
                      ),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ],
    );
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
    return Container(
      height: 200,
      color: MyColor.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select Year',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:8, // Number of columns
              mainAxisSpacing:1,
              crossAxisSpacing: 8,
              childAspectRatio: 1.5, // Adjust for year buttons
            ),
            itemCount: currentYear - startYear + 1, // Total number of years
            itemBuilder: (context, index) {
              final year = startYear + index;
              final isCurrentYear = year == currentYear;
              final isSelected = year == selectedYear;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedYear = year; // Update selected year
                  });
                  widget.onYearSelected(year); // Callback with selected year
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Container(
                  /*alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.blue
                        : isCurrentYear
                        ? Colors.blue.withOpacity(0.2)
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),*/
                  child: Text(
                    year.toString(),
                    style: mediumTextStyle(fontSize:16.0, color:  isSelected || isCurrentYear
                          ?MyColor.appTheme
                          : Colors.black)
                    //   isSelected || isCurrentYear
                    //       ?MyColor.appTheme
                    //       : Colors.black,
                    //   fontWeight: isSelected
                    //       ? FontWeight.bold
                    //       : isCurrentYear
                    //       ? FontWeight.w600
                    //       : FontWeight.normal,
                    // ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
