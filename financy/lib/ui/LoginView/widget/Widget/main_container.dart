 import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/LoginView/widget/Class/bottom_rounded_clipper.dart';
import 'package:flutter/material.dart';

Widget buildTopSection({required Widget child}) {
    return Stack(
      children: [
        _buildShadow(),
        _buildMainContainer(),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ],
    );
  }

  // Método para criar a sombra
  Widget _buildShadow() {
    return Positioned.fill(
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 2,
        shadowColor: AppColors.greenLightOne,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(),
      ),
    );
  }

  // Método para criar o Container principal com o ClipPath
  Widget _buildMainContainer() {
    return ClipPath(
      clipper: BottomRoundedClipper(),
      child: Container(
        color: AppColors.greenLightOne,
      ),
    );
  }
