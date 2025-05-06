import 'package:financy_app/ui/TasksView/widget/Tastks_filter/filter_row.dart';
import 'package:financy_app/ui/TasksView/widget/order_menu_button.dart';
import 'package:financy_app/ui/TasksView/widget/task_list/task_list.dart';
import 'package:financy_app/ui/TasksView/widget/tasks_completed_widget.dart';
import 'package:financy_app/ui/TasksView/widget/tasks_screen_top.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final totalWidth = screenWidth * 0.9;
    const spacing = 12.0;
    final buttonWidth = (totalWidth - 2 * spacing) / 3;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TasksScreentop(screenHeight: screenHeight),
            TasksCompletedWidget(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            Filtersrow(totalWidth: totalWidth, buttonWidth: buttonWidth),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Minhas Tarefas:',
                  style: AppTextStyles.midText.copyWith(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                OrderMenuButton(
                  onSelected: (value) {
                    // TODO: lógica de ordenação
                  },
                ),
              ],
            ),
            Expanded(
              child: TaskListView(),
            ),
          ],
        ),
      ),
    );
  }
}












// import 'package:financy_app/ui/TasksView/widget/Tastks_filter/filter_row.dart';
// import 'package:financy_app/ui/TasksView/widget/order_menu_button.dart';
// import 'package:financy_app/ui/TasksView/widget/task_list/task_list.dart';
// import 'package:financy_app/ui/TasksView/widget/task_list/tasks_card.dart';
// import 'package:financy_app/ui/TasksView/widget/tasks_completed_widget.dart';
// import 'package:financy_app/ui/TasksView/widget/tasks_screen_top.dart';
// import 'package:financy_app/ui/core/theme/app_colors.dart';
// import 'package:financy_app/ui/core/theme/app_text_styles.dart';
// import 'package:flutter/material.dart';

// class TasksScreen extends StatelessWidget {
//   const TasksScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //TODO: Fazer toda a página Reativa e com estado
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     final totalWidth = screenWidth * 0.9;
//     const spacing = 12.0; // espaçamento entre os botões
//     final buttonWidth = (totalWidth - 2 * spacing) / 3;

//     return Scaffold(
//       body: Column(
//         children: [
//           TasksScreentop(screenHeight: screenHeight),
//           TasksCompletedWidget(
//               screenHeight: screenHeight, screenWidth: screenWidth),
//           Filtersrow(totalWidth: totalWidth, buttonWidth: buttonWidth),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Align(
//               alignment: Alignment.center,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Minhas Tarefas:',
//                         style: AppTextStyles.midText.copyWith(
//                             color: Colors.black,
//                             fontSize: 25,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       OrderMenuButton(
//                         onSelected: (value) {
//                           if (value == 'recentes') {
//                             // TODO: Fazer a logica que troca a listagem com base na ordenação desejada
//                           } else if (value == 'antigas') {
//                             // TODO: Fazer a logica que troca a listagem com base na ordenação desejada
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                   Expanded(child: TaskListView())
//                   // TaskCard(
//                   //   titulo: 'Lavar o carro',
//                   //   data: '12/01/2022',
//                   //   prioridade: 'Prioridade Alta',
//                   //   corPrioridade: Colors.red,
//                   //   onTap: () {
//                   //     // TODO: lógica quando o card for clicado
//                   //   },
//                   // ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//       backgroundColor: AppColors.white,
//     );
//   }
// }
