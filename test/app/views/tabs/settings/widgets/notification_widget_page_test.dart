import 'package:financialcontroleeapp/app/views/tabs/settings/widgets/notification_widget_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';

void main() {
  group('NotificationWidgetPage', () {
    testWidgets('has a title and message', (tester) async {
      await tester.pumpWidget(
          buildTestableWidget(NotificationWidgetPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}