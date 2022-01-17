import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:renest/app/modules/home/components/clearable_text_form_field.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/app/modules/home/views/home_view.dart';
import 'package:renest/app/modules/home/views/search_view.dart';

Widget testWidget({required Widget child}) {
  return GetMaterialApp(
    home: child,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final controller = HomeController(testMode: true);
  Get.put(controller);

  setupTests(WidgetTester tester) async {
    await tester.pumpWidget(testWidget(child: HomeView()));
    Get.to(() => SearchView());
    await tester.pumpAndSettle();
  }

  group("Search View", () {
    final searchBar = find.byKey(SearchView.searchKey, skipOffstage: false);

    testWidgets('Type Search', (WidgetTester tester) async {
      // setup testing env
      await setupTests(tester);

      // Check that the total items in the task list is 2 after searching for "RE"
      controller.startSearch();
      await tester.enterText(searchBar, "re");
      await tester.pumpAndSettle();
      expect(controller.tasks.length, 2);

      // test entering re then clearing the field.
      await tester.enterText(searchBar, "re");
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(ClearableTextFormField.clearButtonKey));
      expect(controller.tasks.length, 10);

      // test entering te
      await tester.enterText(searchBar, "te");
      await tester.pumpAndSettle();
      expect(controller.tasks.length, 4, reason: "Numbers of items should be 4");

      // test leaving the search page and returning to homeView task list should be restored.
      controller.endSearch();
      await tester.tap(find.text("Cancel"));
      await tester.pumpAndSettle();
      expect(controller.tasks.length, 10);
    });
  });
}
