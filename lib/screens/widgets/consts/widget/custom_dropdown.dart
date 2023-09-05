import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final void Function(String?) onChanged;

  const CustomDropdown(
      {super.key,
      required this.options,
      required this.selectedOption,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final dropdownValue =
        options.contains(selectedOption) ? selectedOption : options.first;

    return DropdownButton<String>(
      icon: const Icon(Iconsax.arrow_left_24),
      value: dropdownValue,
      onChanged: onChanged,
      underline: Text(
        "",
      ),
      dropdownColor: AppColors.customappColors,
      borderRadius: BorderRadius.circular(20),
      items: options.map<DropdownMenuItem<String>>((String option) {
        return DropdownMenuItem<String>(
          alignment: Alignment.center,
          value: option,
          child: CustomTextCuption(
              color: Colors.white, fontSize: 16, title: option),
        );
      }).toList(),
    );
  }
}
