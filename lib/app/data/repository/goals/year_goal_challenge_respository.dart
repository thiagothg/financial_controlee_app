import 'package:financial_controlee_app/app/data/provider/goals/year_goal_challenge_provider.dart';
import 'package:financial_controlee_app/app/global/core/services/gql_client.dart';
import 'package:get/get.dart';
import '../../model/goals/year_goal_challenge_model.dart';

class YearGoalChallangeRepository {
  final goalProvider = YearGoalChallageProvider(Get.find<GraphQLClient>());

  // GoalRepository(this.api);

  Future<List<YearGoalChallenge>> getGoals(String uid) async {
    var res = await goalProvider
        .getGoals(uid)
        .then((e) => e.map((e) => YearGoalChallenge.fromJson(e)));

    return res.toList();
  }
}
