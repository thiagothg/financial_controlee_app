import 'package:financial_controlee_app/app/data/model/goals/year_goal_challenge_week_model.dart';
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

  Future<bool> save(YearGoalChallenge model) async {
    var map = {'objects': model.toJson()};

    return await goalProvider.save(map);
  }

  Future<bool> delete(String id) async {
    return await goalProvider.delete(id);
  }

  Future<bool> updateGoalAndWeek(
      YearGoalChallenge goal, YearGoalChallengeWeek week) async {
    var data = {
      "id": goal.id,
      "_set": {"progress": goal.progress, "qtd_saved": goal.qtdSaved},
      "id1": week.id,
      "_set1": {"saved": week.saved}
    };
    return await goalProvider.updateGoalWeek(data);
  }
}
