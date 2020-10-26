import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'goal_detail_controller.g.dart';

@Injectable()
class GoalDetailController = _GoalDetailControllerBase
    with _$GoalDetailController;

abstract class _GoalDetailControllerBase with Store {
  
}
