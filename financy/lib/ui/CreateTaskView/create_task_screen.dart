import 'package:financy_app/domain/models/tasks/tasks.dart';
import 'package:financy_app/mock/mock.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:financy_app/routing/routes.dart';

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

  void _salvarTask() {
    if (_formKey.currentState!.validate()) {
      // Aqui você criaria o objeto Task e salvaria
      final task = Task(
          usuarioId: TaskMockupList.defaultUserId,
          taskId: TaskMockupList.getNextTaskId(),
          titulo: _tituloController.text,
          descricao: _descricaoController.text,
          statusId: _statusId,
          prioridade: _prioridade,
          criadoEm: _criadoEm);

      TaskMockupList.addTask(task);

      // Mostrar feedback ao usuário
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Task criada com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      // Voltar para tela anterior
      context.go(Routes.tasks);
    }
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.greenWhite,
      appBar: AppBar(
        title: Text('Nova Task',
            style: AppTextStyles.midText.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: screenHeight * 0.025)),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Campo Título
            Text(
              'Título',
              style: AppTextStyles.midText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _tituloController,
              decoration: InputDecoration(
                hintText: 'Digite o título da task',
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira um título';
                }
                if (value.length < 3) {
                  return 'O título deve ter no mínimo 3 caracteres';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Campo Descrição
            Text(
              'Descrição',
              style: AppTextStyles.midText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descricaoController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Descreva os detalhes da task',
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira uma descrição';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Seletor de Prioridade
            Text(
              'Prioridade',
              style: AppTextStyles.midText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getPrioridadeLabel(_prioridade),
                          style: AppTextStyles.midText.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _getPrioridadeColor(_prioridade),
                          ),
                        ),
                        const SizedBox(height: 4),
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: _getPrioridadeColor(_prioridade),
                            thumbColor: _getPrioridadeColor(_prioridade),
                            inactiveTrackColor: Colors.grey[300],
                          ),
                          child: Slider(
                            value: _prioridade.toDouble(),
                            min: 1,
                            max: 3,
                            divisions: 2,
                            onChanged: (value) {
                              setState(() {
                                _prioridade = value.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Seletor de Status
            Text(
              'Status',
              style: AppTextStyles.midText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButtonFormField<int>(
                value: _statusId,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
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

            const SizedBox(height: 24),

            // Seletor de Data
            Text(
              'Data de Criação',
              style: AppTextStyles.midText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: _selecionarData,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.grey),
                    const SizedBox(width: 12),
                    Text(
                      '${_criadoEm.day.toString().padLeft(2, '0')}/${_criadoEm.month.toString().padLeft(2, '0')}/${_criadoEm.year}',
                      style: AppTextStyles.midText.copyWith(fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Botão Salvar
            ElevatedButton(
              onPressed: _salvarTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: Text(
                'Criar Task',
                style: AppTextStyles.midText.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
