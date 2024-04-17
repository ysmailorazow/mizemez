import 'package:get/get.dart';

import 'states/statefull_data.dart';

mixin ControlStateMixinVariables<T> {
  StatefulData<T> state = StatefulData.empty();
  Rx<StatefulData<T>> rxState = Rx(StatefulData.empty());
  Status status = Status.none;
  Rx<Status> rxStatus = Rx(Status.none);
}
