import 'package:flutter/material.dart';
import 'package:ibank/core/constants/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:ibank/core/widgets/top_bar_widget.dart';

class AddNewBeneficiary extends StatelessWidget {
  const AddNewBeneficiary({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          const TopBarWidget(title: 'Add New'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
