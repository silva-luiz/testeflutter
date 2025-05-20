import 'package:mobx/mobx.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';
import '../entities/table.entity.dart';

part 'table_store.g.dart';

class TableStore = _TableStoreBase with _$TableStore;

abstract class _TableStoreBase with Store {
  _TableStoreBase(this._entity) {
    identification = _entity.identification;
    customers = ObservableList.of(_entity.customers);
  }

  final TableEntity _entity;

  @observable
  String identification = '';

  @observable
  ObservableList<CustomerEntity> customers = ObservableList<CustomerEntity>();

  @computed
  int get customerCount => customers.length;

  TableEntity toEntity() {
    return TableEntity(
      id: _entity.id,
      identification: identification,
      customers: customers.toList(),
    );
  }

  @action
  void setIdentification(String value) {
    identification = value;
  }

  @action
  void addCustomer(CustomerEntity customer) {
    customers.add(customer);
  }

  @action
  void removeCustomer(int index) {
    customers.removeAt(index);
  }

  @action
  void updateCustomer(int index, CustomerEntity newCustomer) {
    customers[index] = newCustomer;
  }

  @action
  void setCustomers(List<CustomerEntity> newList) {
    customers = ObservableList.of(newList);
  }
}
