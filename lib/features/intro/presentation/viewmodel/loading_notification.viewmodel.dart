import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/intro/presentation/providers/loading_page_provider.dart';
import 'package:home_automation_app/helpers/enums.dart';

class LoadingNotificationViewModel extends StateNotifier<AppLoadingStates> {
  final Ref ref;
  LoadingNotificationViewModel(super._state, this.ref);

  Future<void> triggerLoading() async {
    state = AppLoadingStates.loading;

    ref.read(loadingMessageProvider.notifier).state = 'Initializing App...';

    // perform waiting Logic here
    await Future.delayed(const Duration(seconds: 1));

    ref.read(loadingMessageProvider.notifier).state = 'Loading Device List...';

    // perform waiting logic here
    await Future.delayed(const Duration(seconds: 1));

    ref.read(loadingMessageProvider.notifier).state =
        'Loading Outlet Config...';

    // perform waiting logic here
    await Future.delayed(const Duration(seconds: 1));

    ref.read(loadingMessageProvider.notifier).state = 'Done!';

    state = AppLoadingStates.success;
  }
}
