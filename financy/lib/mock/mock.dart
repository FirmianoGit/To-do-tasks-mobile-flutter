import 'package:financy_app/domain/models/tasks/tasks.dart';

class TaskMockupList {
  /// Lista estática que armazena todas as tasks (mock + novas adicionadas)
  static final List<Task> _tasks = [];
  static const int defaultUserId = 999; // ID de usuário padrão para tasks mock
  /// Flag para controlar se as tasks padrão já foram inicializadas
  static bool _initialized = false;

  /// Inicializa a lista com as tasks mock padrão
  static void _initializeMockTasks() {
    if (_initialized) return;
    _initialized = true;
    _tasks.addAll([
      Task(
        taskId: 1,
        titulo: 'Finalizar relatório mensal',
        descricao: 'Concluir o relatório financeiro do mês de abril',
        statusId: 1,
        usuarioId: 101,
        criadoEm: DateTime.parse('2025-05-01'),
        prioridade: 3,
      ),
      Task(
        taskId: 2,
        titulo: 'Revisar código do módulo de login',
        descricao: 'Refatorar e revisar autenticação de usuários',
        statusId: 2,
        usuarioId: 102,
        criadoEm: DateTime.parse('2025-05-02'),
        prioridade: 2,
      ),
      Task(
        taskId: 3,
        titulo: 'Planejar reunião com o time de marketing',
        descricao: 'Alinhar estratégia da próxima campanha',
        statusId: 1,
        usuarioId: 103,
        criadoEm: DateTime.parse('2025-05-03'),
        prioridade: 1,
      ),
      Task(
        taskId: 4,
        titulo: 'Atualizar site institucional',
        descricao: 'Modificar seção de serviços',
        statusId: 1,
        usuarioId: 104,
        criadoEm: DateTime.parse('2025-05-04'),
        prioridade: 2,
      ),
      Task(
        taskId: 5,
        titulo: 'Responder e-mails pendentes',
        descricao: 'Organizar e limpar caixa de entrada',
        statusId: 1,
        usuarioId: 105,
        criadoEm: DateTime.parse('2025-05-05'),
        prioridade: 1,
      ),
      Task(
        taskId: 6,
        titulo: 'Reunião com fornecedores',
        descricao: 'Negociar prazos e condições',
        statusId: 1,
        usuarioId: 106,
        criadoEm: DateTime.parse('2025-05-06'),
        prioridade: 3,
      ),
      Task(
        taskId: 7,
        titulo: 'Publicar post no blog',
        descricao: 'Texto sobre boas práticas de segurança',
        statusId: 1,
        usuarioId: 107,
        criadoEm: DateTime.parse('2025-05-07'),
        prioridade: 2,
      ),
      Task(
        taskId: 8,
        titulo: 'Backup do sistema',
        descricao: 'Executar backup completo do servidor',
        statusId: 2,
        usuarioId: 108,
        criadoEm: DateTime.parse('2025-05-08'),
        prioridade: 1,
      ),
      Task(
        taskId: 9,
        titulo: 'Criar wireframe do novo app',
        descricao: 'Prototipar interfaces básicas',
        statusId: 1,
        usuarioId: 109,
        criadoEm: DateTime.parse('2025-05-09'),
        prioridade: 2,
      ),
      Task(
        taskId: 10,
        titulo: 'Treinamento de novos colaboradores',
        descricao: 'Apresentar processos da empresa',
        statusId: 1,
        usuarioId: 110,
        criadoEm: DateTime.parse('2025-05-10'),
        prioridade: 1,
      ),
      Task(
        taskId: 11,
        titulo: 'Preparar apresentação trimestral',
        descricao: 'Slides e gráficos de desempenho',
        statusId: 2,
        usuarioId: 111,
        criadoEm: DateTime.parse('2025-05-11'),
        prioridade: 3,
      ),
      Task(
        taskId: 12,
        titulo: 'Corrigir bugs no checkout',
        descricao: 'Erro ao finalizar compra com boleto',
        statusId: 1,
        usuarioId: 112,
        criadoEm: DateTime.parse('2025-05-12'),
        prioridade: 3,
      ),
      Task(
        taskId: 13,
        titulo: 'Monitorar uso de recursos',
        descricao: 'Verificar uso de CPU e memória',
        statusId: 1,
        usuarioId: 113,
        criadoEm: DateTime.parse('2025-05-13'),
        prioridade: 2,
      ),
      Task(
        taskId: 14,
        titulo: 'Atualizar documentação técnica',
        descricao: 'Revisar endpoints da API',
        statusId: 1,
        usuarioId: 114,
        criadoEm: DateTime.parse('2025-05-14'),
        prioridade: 2,
      ),
      Task(
        taskId: 15,
        titulo: 'Agendar manutenção da rede',
        descricao: 'Troca de equipamentos no datacenter',
        statusId: 2,
        usuarioId: 115,
        criadoEm: DateTime.parse('2025-05-15'),
        prioridade: 1,
      ),
      Task(
        taskId: 16,
        titulo: 'Verificar integrações com ERP',
        descricao: 'Sincronização de dados de estoque',
        statusId: 1,
        usuarioId: 116,
        criadoEm: DateTime.parse('2025-05-16'),
        prioridade: 3,
      ),
      Task(
        taskId: 17,
        titulo: 'Testar versão beta do app',
        descricao: 'Executar testes exploratórios',
        statusId: 1,
        usuarioId: 117,
        criadoEm: DateTime.parse('2025-05-17'),
        prioridade: 2,
      ),
      Task(
        taskId: 18,
        titulo: 'Elaborar plano de ação para Q3',
        descricao: 'Definir metas estratégicas',
        statusId: 1,
        usuarioId: 118,
        criadoEm: DateTime.parse('2025-05-18'),
        prioridade: 2,
      ),
      Task(
        taskId: 19,
        titulo: 'Criar campanha de e-mail marketing',
        descricao: 'Promoção do novo plano anual',
        statusId: 2,
        usuarioId: 119,
        criadoEm: DateTime.parse('2025-05-19'),
        prioridade: 1,
      ),
      Task(
        taskId: 20,
        titulo: 'Auditar permissões de acesso',
        descricao: 'Revisar grupos de usuários no sistema',
        statusId: 1,
        usuarioId: 120,
        criadoEm: DateTime.parse('2025-05-20'),
        prioridade: 3,
      ),
    ]);
  }

  /// Obtém todas as tasks (mock + adicionadas)
  static List<Task> getMockTasks() {
    _initializeMockTasks();
    return _tasks;
  }

  /// Adiciona uma nova task à lista
  /// Retorna true se adicionado com sucesso
  static bool addTask(Task newTask) {
    _initializeMockTasks();
    _tasks.add(newTask);
    return true;
  }

  /// Adiciona múltiplas tasks de uma vez
  static void addMultipleTasks(List<Task> newTasks) {
    _initializeMockTasks();
    _tasks.addAll(newTasks);
  }

  /// Remove uma task pelo ID
  static bool removeTaskById(int taskId) {
    _initializeMockTasks();
    final initialLength = _tasks.length;
    _tasks.removeWhere((task) => task.taskId == taskId);
    return _tasks.length < initialLength;
  }

  /// Atualiza uma task existente
  static bool updateTask(Task updatedTask) {
    _initializeMockTasks();
    final index = _tasks.indexWhere((task) => task.taskId == updatedTask.taskId);
    if (index != -1) {
      _tasks[index] = updatedTask;
      return true;
    }
    return false;
  }

  /// Obtém uma task específica pelo ID
  static Task? getTaskById(int taskId) {
    _initializeMockTasks();
    try {
      return _tasks.firstWhere((task) => task.taskId == taskId);
    } catch (e) {
      return null;
    }
  }

  /// Limpa todas as tasks
  static void clearAllTasks() {
    _tasks.clear();
    _initialized = false;
  }

  /// Retorna a quantidade total de tasks
  static int getTaskCount() {
    _initializeMockTasks();
    return _tasks.length;
  }

  static int getNextTaskId() {
    _initializeMockTasks();
    if (_tasks.isEmpty) return 1;
    return _tasks.map((task) => task.taskId).reduce((a, b) => a > b ? a : b) + 1;
  }
}
