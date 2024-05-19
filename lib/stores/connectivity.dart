import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:mobx/mobx.dart';

part 'connectivity.g.dart';

class ConnectivityStore = ConnectivityStoreBase with _$ConnectivityStore;

abstract class ConnectivityStoreBase with Store {
  ConnectivityStoreBase() {
    _setupListener();
  }

  void _setupListener() {
    DataConnectionChecker().checkInterval = const Duration(seconds: 5);
    DataConnectionChecker().onStatusChange.listen(
      (e) {
        setConnected(e == DataConnectionStatus.connected);
      },
    );
  }

  @observable
  bool connected = true;

  @action
  void setConnected(bool value) => connected = value;
}
