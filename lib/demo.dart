import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  List<String> selectedItems = [];
  List<String> toolused = ['Tool 1', 'Tool 2', 'Tool 3'];
  bool dropopen = false;
  String _isFocusedcolor = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Example"),
      ),
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedItems.isEmpty
                        ? "Select Tools"
                        : "${selectedItems.join(', ')}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: selectedItems.isEmpty ? Colors.grey : Colors.blue,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: toolused.asMap().entries.map((entry) {
              int index = entry.key;
              String tool = entry.value;

              return DropdownMenuItem(
                value: tool,
                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    final isSelected = selectedItems.contains(tool);
                    return Wrap(
                      children: [
                        ListTile(
                          minTileHeight: 30,
                          contentPadding: EdgeInsets.zero,
                          title: Container(
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    shape: const CircleBorder(
                                      side: BorderSide.none,
                                    ),
                                    value: isSelected,
                                    activeColor: Colors.white,
                                    checkColor: Colors.blue,
                                    fillColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value == true) {
                                        setState(() {
                                          selectedItems.add(tool);
                                        });
                                      } else {
                                        setState(() {
                                          selectedItems.remove(tool);
                                        });
                                      }
                                      menuSetState(() {});
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    tool,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Only show the divider if this is not the last item
                        if (index <
                            toolused.length -
                                1) // Check if it is not the last item
                          const Padding(
                            padding: EdgeInsets.only(top: 2, bottom: 12),
                            child: Divider(
                              height: 1,
                            ),
                          ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
            value: null,
            onMenuStateChange: (isOpen) {
              dropopen = isOpen;
              _isFocusedcolor = "dropdown";
              setState(() {});
            },
            onChanged: (value) {}, // No action needed here
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: size.width * 0.95,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                border: Border.all(
                    color: _isFocusedcolor == "dropdown"
                        ? Colors.yellow
                        : Colors.grey),
              ),
              elevation: 0,
            ),
            iconStyleData: IconStyleData(
              icon: dropopen
                  ? Icon(Icons.arrow_drop_up_sharp)
                  : Icon(Icons.arrow_drop_down),
              iconSize: 20,
              iconEnabledColor: Colors.blue,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 250,
              width: size.width * 0.93,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              offset: const Offset(0, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(20),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 1, right: 1),
            ),
          ),
        ),
      ),
    );
  }
}
