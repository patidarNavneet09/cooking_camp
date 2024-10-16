import 'package:cooking_champs/constant/mycolor.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class YourMultiSelectDropdown extends StatefulWidget {
  @override
  _YourMultiSelectDropdownState createState() =>
      _YourMultiSelectDropdownState();
}

class _YourMultiSelectDropdownState extends State<YourMultiSelectDropdown> {
  // List of tools available in the dropdown
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              Expanded(
                child: Text(
                  "Select Tools (max $maxSelection)",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: MyColor.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          // The dropdown is populated by the toolused list
          items: toolused.map((tool) {
            return DropdownMenuItem(
              // Use the tool's name as the value
              value: tool.name,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = selectedItems.contains(tool.name);
                  return ListTile(
                    leading: Transform.scale(
                      scale: 1.2, // Scale to make the checkbox larger
                      child: Checkbox(
                        shape: const CircleBorder(), // Circular shape
                        value: isSelected,
                        activeColor: Colors.green, // Checked state color
                        onChanged: (value) {
                          // Update state and allow max selections
                          if (value == true &&
                              selectedItems.length < maxSelection) {
                            setState(() {
                              selectedItems.add(tool.name);
                            });
                            menuSetState(() {}); // Rebuild checkbox in dropdown
                          } else if (value == false) {
                            setState(() {
                              selectedItems.remove(tool.name);
                            });
                            menuSetState(() {}); // Rebuild checkbox in dropdown
                          }
                        },
                      ),
                    ),
                    title: Text(
                      tool.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColor.black,
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
          // The value displayed is the list of selected items
          value: null, // Leave value null as we are selecting multiple items
          onChanged: (_) {},
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: size.width * 0.90,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColor.graylite,
            ),
            elevation: 0,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 20,
            iconEnabledColor: MyColor.red,
            iconDisabledColor: MyColor.blue,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: size.width * 0.90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: MyColor.graylite,
            ),
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(20),
              thickness: WidgetStateProperty.all<double>(6),
              thumbVisibility: WidgetStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}

// Class representing a tool item
class ToolUsed {
  final String name;
  ToolUsed({required this.name});
}
