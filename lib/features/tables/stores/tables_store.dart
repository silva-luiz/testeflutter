import 'package:mobx/mobx.dart';
import 'table_store.dart';

part 'tables_store.g.dart';

class TablesStore = _TablesStoreBase with _$TablesStore;

abstract class _TablesStoreBase with Store {
  @observable
  ObservableList<TableStore> tables = ObservableList<TableStore>();

  @computed
  int get totalTables => tables.length;

  @action
  void addTable(TableStore tableStore) {
    tables.add(tableStore);
  }

  @action
  void editTable(int index, TableStore newTableStore) {
    tables[index] = newTableStore;
  }

  @action
  void removeTable(int index) {
    tables.removeAt(index);
  }

  @action
  void setTables(List<TableStore> tableStores) {
    tables = ObservableList.of(tableStores);
  }
}
