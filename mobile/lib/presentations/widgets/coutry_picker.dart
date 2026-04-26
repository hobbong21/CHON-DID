import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/core/theme/app_theme.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoutryPicker extends StatefulWidget {
  final TextEditingController? countryController;
  const CoutryPicker({super.key, this.countryController});

  @override
  State<CoutryPicker> createState() => _CoutryPickerState();
}

class _CoutryPickerState extends State<CoutryPicker> {
  TextEditingController get countryController =>
      widget.countryController ?? TextEditingController();

  showCountry() {
    final colors = context.colors;
    showCountryPicker(
      context: context,
      countryFilter: ['US', 'GB', 'AU', 'CA', 'KR', 'VN', 'JP', 'CN', 'TW'],
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
        bottomSheetHeight: 500, // Optional. Country list modal height
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.grey, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.grey, width: 0.5),
          ),
        ),
      ),
      onSelect: (Country country) {
        countryController.text = '+${country.phoneCode}';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return InkWell(
      onTap: () {
        showCountry();
      },
      child: ValueListenableBuilder(
          valueListenable: countryController,
          builder: (context, value, child) {
            return Container(
              color: Colors.grey.shade300,
              width: 50.r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value.text,
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
