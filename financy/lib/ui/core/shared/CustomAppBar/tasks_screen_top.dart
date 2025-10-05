import 'package:financy_app/ui/core/shared/CustomAppBar/widgets/notification_item.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// AppTopBar responsiva com barra de pesquisa sempre visível
class ImprovedTasksScreenTop extends StatefulWidget implements PreferredSizeWidget {
  const ImprovedTasksScreenTop({
    super.key,
    this.userName = 'UNLOGED',
    this.notificationCount = 0,
    this.onNotificationTap,
    this.onProfileTap,
    this.onSearchChanged,
    this.onLogout,
    this.onViewProfile,
    this.onSettings,
    this.notifications = const [],
  });

  final String userName;
  final int notificationCount;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onLogout;
  final VoidCallback? onViewProfile;
  final VoidCallback? onSettings;
  final List<NotificationItem> notifications;

  @override
  State<ImprovedTasksScreenTop> createState() => _ImprovedTasksScreenTopState();

  @override
  Size get preferredSize {
    // Altura responsiva: 18% da altura da tela
    return const Size.fromHeight(180);
  }
}

class _ImprovedTasksScreenTopState extends State<ImprovedTasksScreenTop> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {}); // Atualiza UI quando o texto muda
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Bom dia';
    } else if (hour < 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }

  void _showProfileMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(button.size.bottomLeft(Offset.zero), ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu<String>(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 8,
      items: [
        PopupMenuItem<String>(
          value: 'profile',
          child: Row(
            children: [
              Icon(Icons.person_outline, size: 20, color: Colors.grey.shade700),
              const SizedBox(width: 12),
              const Text('Ver Perfil'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'settings',
          child: Row(
            children: [
              Icon(Icons.settings_outlined, size: 20, color: Colors.grey.shade700),
              const SizedBox(width: 12),
              const Text('Configurações'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.logout, size: 20, color: Colors.red.shade600),
              const SizedBox(width: 12),
              Text('Sair', style: TextStyle(color: Colors.red.shade600)),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        switch (value) {
          case 'profile':
            widget.onViewProfile?.call();
            break;
          case 'settings':
            widget.onSettings?.call();
            break;
          case 'logout':
            widget.onLogout?.call();
            break;
        }
      }
    });
  }

  void _showNotificationsMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(button.size.bottomLeft(Offset.zero), ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu<int>(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 8,
      constraints: const BoxConstraints(
        maxWidth: 320,
        maxHeight: 400,
      ),
      items: [
        PopupMenuItem<int>(
          enabled: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Notificações',
              style: AppTextStyles.bigText.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const PopupMenuDivider(),
        if (widget.notifications.isEmpty)
          PopupMenuItem<int>(
            enabled: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.notifications_off_outlined,
                      size: 48,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Nenhuma notificação',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          ...widget.notifications.asMap().entries.map((entry) {
            final index = entry.key;
            final notification = entry.value;
            return PopupMenuItem<int>(
              value: index,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: notification.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        notification.icon,
                        color: notification.color,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            notification.message,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            notification.time,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      ],
    ).then((index) {
      if (index != null && index < widget.notifications.length) {
        widget.notifications[index].onTap?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Proporções responsivas
    final horizontalPadding = screenWidth * 0.05; // 5% da largura
    final avatarSize = screenWidth * 0.11; // 11% da largura (máx 50px)
    final iconButtonSize = screenWidth * 0.10; // 10% da largura (máx 44px)
    final greetingFontSize = screenWidth * 0.038; // 3.8% da largura
    final nameFontSize = screenWidth * 0.055; // 5.5% da largura
    
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: screenHeight * 0.18, // 18% da altura da tela
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding.clamp(16.0, 24.0),
              vertical: screenHeight * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header principal com saudação e ações
                Row(
                  children: [
                    // Avatar do usuário
                    Builder(
                      builder: (context) => Container(
                        width: avatarSize.clamp(40.0, 50.0),
                        height: avatarSize.clamp(40.0, 50.0),
                        decoration: BoxDecoration(
                          color: AppColors.greenLightTwo.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(avatarSize.clamp(40.0, 50.0) / 2),
                          border: Border.all(
                            color: AppColors.greenLightTwo.withValues(alpha: 0.3),
                            width: 2,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () => _showProfileMenu(context),
                          icon: Icon(
                            Icons.person_rounded,
                            color: AppColors.greenLightTwo,
                            size: (avatarSize * 0.55).clamp(20.0, 28.0),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    
                    SizedBox(width: screenWidth * 0.04),
                    
                    // Saudação e nome do usuário
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getGreeting(),
                            style: AppTextStyles.thinText.copyWith(
                              fontSize: greetingFontSize.clamp(14.0, 18.0),
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.003),
                          Text(
                            widget.userName,
                            style: AppTextStyles.bigText.copyWith(
                              fontSize: nameFontSize.clamp(18.0, 24.0),
                              color: AppColors.greenLightTwo,
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    
                    // Botão de notificações com badge
                    Builder(
                      builder: (context) => Stack(
                        children: [
                          Container(
                            width: iconButtonSize.clamp(38.0, 44.0),
                            height: iconButtonSize.clamp(38.0, 44.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(iconButtonSize.clamp(38.0, 44.0) / 2),
                            ),
                            child: IconButton(
                              onPressed: () => _showNotificationsMenu(context),
                              icon: Icon(
                                Icons.notifications_none_rounded,
                                color: Colors.grey.shade700,
                                size: (iconButtonSize * 0.55).clamp(20.0, 24.0),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          
                          // Badge de notificação
                          if (widget.notificationCount > 0)
                            Positioned(
                              right: iconButtonSize * 0.12,
                              top: iconButtonSize * 0.12,
                              child: Container(
                                padding: EdgeInsets.all(screenWidth * 0.008),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade500,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: screenWidth * 0.045,
                                  minHeight: screenWidth * 0.045,
                                ),
                                child: Text(
                                  widget.notificationCount > 99 
                                    ? '99+' 
                                    : widget.notificationCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (screenWidth * 0.025).clamp(9.0, 11.0),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: screenHeight * 0.018),
                
                // Barra de pesquisa sempre visível
                Container(
                  height: screenHeight * 0.055, // 5.5% da altura
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular((screenHeight * 0.055) / 2),
                    border: Border.all(
                      color: _searchFocusNode.hasFocus 
                        ? AppColors.greenLightTwo.withValues(alpha: 0.5)
                        : Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    onChanged: widget.onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Pesquisar tarefas...',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: (screenWidth * 0.035).clamp(12.0, 15.0),
                      ),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: AppColors.greenLightTwo,
                        size: (screenWidth * 0.05).clamp(18.0, 22.0),
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(
                              Icons.clear_rounded,
                              color: Colors.grey.shade500,
                              size: (screenWidth * 0.045).clamp(18.0, 20.0),
                            ),
                            onPressed: () {
                              _searchController.clear();
                              if (widget.onSearchChanged != null) {
                                widget.onSearchChanged!('');
                              }
                            },
                          )
                        : null,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.015,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: (screenWidth * 0.035).clamp(12.0, 15.0),
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
