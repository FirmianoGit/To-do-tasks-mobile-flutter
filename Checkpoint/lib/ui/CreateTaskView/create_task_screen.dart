import 'package:financy_app/core/State/app_loading_controller.dart';
import 'package:financy_app/domain/models/tasks/tasks.dart';
import 'package:financy_app/mock/mock.dart';
import 'package:financy_app/routing/routes.dart';
import 'package:financy_app/ui/CreateTaskView/view_model/create_task_view_model.dart';
import 'package:financy_app/ui/CreateTaskView/widget/task_input_decoration.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:financy_app/ui/core/utils/screen_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  int _prioridade = 2; // Prioridade média como padrão
  int _statusId = 1; // Status padrão
  DateTime _criadoEm = DateTime.now();

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvarTask() async {
    final loading = context.read<AppLoadingController>();
    loading.show();
    if (_formKey.currentState!.validate()) {
      final task = Task(
        usuarioId: TaskMockupList.defaultUserId,
        taskId: TaskMockupList.getNextTaskId(),
        titulo: _tituloController.text,
        descricao: _descricaoController.text,
        statusId: _statusId,
        prioridade: _prioridade,
        criadoEm: _criadoEm,
      );

      // Chamar o ViewModel para adicionar a tarefa
      final taskCreated =
          await CreateTaskViewModel().adicionarTarefa(context, task);

      if (!taskCreated && context.mounted) {
        // Tratar erro na criação da tarefa
        // Exibir mensagem de erro ao usuário
        showQuickErrorAlert(
          context: context,
          title: 'Erro',
          text: 'Não foi possível criar a task. Tente novamente.',
        );
        loading.hide();
        return;
      }
      showQuickSuccessAlert(
        context: context,
        title: 'Sucesso!',
        text: 'Task criada com sucesso.',
        onConfirmBtnTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // 👈 chave
          Navigator.of(context, rootNavigator: true).pop();
          context.go(Routes.tasks);
        },
      );

      // Mostrar feedback ao usuário

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Task criada com sucesso!'),
      //     backgroundColor: Colors.green,
      //   ),
      // );

      // Limpar formulário
      _tituloController.clear();
      _descricaoController.clear();
      _prioridade = 2;
      _statusId = 1;
      _criadoEm = DateTime.now();
    }
    loading.hide();
  }

  Future<void> _selecionarData() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _criadoEm,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      locale: const Locale('pt', 'BR'),
    );

    if (picked != null && picked != _criadoEm) {
      setState(() {
        _criadoEm = picked;
      });
    }
  }

  String _getPrioridadeLabel(int prioridade) {
    switch (prioridade) {
      case 1:
        return 'Baixa';
      case 2:
        return 'Média';
      case 3:
        return 'Alta';
      default:
        return 'Média';
    }
  }

  Color _getPrioridadeColor(int prioridade) {
    switch (prioridade) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

// ===== SEÇÃO PADRÃO =====
  Widget formSection({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.midText.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        child,
        const SizedBox(height: 16),
      ],
    );
  }

// ===== BUILD =====
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              left: 8,
              right: 8,
              bottom: 12,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: AppColors.greenLightTwo),
                  onPressed: () => context.go(Routes.tasks),
                ),
                Text(
                  'Nova Task',
                  style: AppTextStyles.midText.copyWith(
                    color: AppColors.greenLightTwo,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // TÍTULO
                  formSection(
                    title: 'Título',
                    child: TextFormField(
                      controller: _tituloController,
                      decoration:
                          taskInputDecoration('Digite o título da task'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe um título';
                        }
                        if (value.length < 3) {
                          return 'Mínimo de 3 caracteres';
                        }
                        return null;
                      },
                    ),
                  ),

                  // DESCRIÇÃO
                  formSection(
                    title: 'Descrição',
                    child: TextFormField(
                      controller: _descricaoController,
                      maxLines: 4,
                      decoration:
                          taskInputDecoration('Descreva os detalhes da task'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe uma descrição';
                        }
                        return null;
                      },
                    ),
                  ),

                  // PRIORIDADE
                  formSection(
                    title: 'Prioridade',
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.greenLightTwo),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: _getPrioridadeColor(_prioridade)
                                  .withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _getPrioridadeLabel(_prioridade),
                              style: AppTextStyles.midText.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: _getPrioridadeColor(_prioridade),
                              ),
                            ),
                          ),
                          Slider(
                            value: _prioridade.toDouble(),
                            min: 1,
                            max: 3,
                            divisions: 2,
                            activeColor: _getPrioridadeColor(_prioridade),
                            onChanged: (value) {
                              setState(() {
                                _prioridade = value.toInt();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // STATUS
                  formSection(
                    title: 'Status',
                    child: DropdownButtonFormField<int>(
                      value: _statusId,
                      decoration: taskInputDecoration('Selecione o status'),
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('Pendente')),
                        DropdownMenuItem(value: 2, child: Text('Em Progresso')),
                        DropdownMenuItem(value: 3, child: Text('Concluída')),
                        DropdownMenuItem(value: 4, child: Text('Cancelada')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _statusId = value!;
                        });
                      },
                    ),
                  ),

                  // DATA
                  formSection(
                    title: 'Data de inicio',
                    child: InkWell(
                      onTap: _selecionarData,
                      borderRadius: BorderRadius.circular(12),
                      child: InputDecorator(
                        decoration: taskInputDecoration(''),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 20),
                            const SizedBox(width: 12),
                            Text(
                              '${_criadoEm.day.toString().padLeft(2, '0')}/'
                              '${_criadoEm.month.toString().padLeft(2, '0')}/'
                              '${_criadoEm.year}',
                              style:
                                  AppTextStyles.midText.copyWith(fontSize: 16),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // BOTÃO
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _salvarTask,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle_outline,
                              color: AppColors.white),
                          SizedBox(width: 4),
                          Text(
                            'Criar Task',
                            style: AppTextStyles.midText.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
