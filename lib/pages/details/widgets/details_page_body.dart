import 'package:flutter/material.dart';
import 'package:poke_dex/pages/about_page/about_page.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class DetailsPageBody extends StatelessWidget {
  /// Function that will change widget sizes using [state] as a reference
  final void Function(SheetState state) handleSheetStateChanged;

  const DetailsPageBody({
    Key? key,
    required this.handleSheetStateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SlidingSheet(
      listener: (state) => handleSheetStateChanged(state),
      elevation: 0,
      cornerRadius: 30,
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [0.60, 0.87],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        return SizedBox(
          height: height - height * 0.12,
          child: const AboutPage(),
        );
      },
    );
  }
}
