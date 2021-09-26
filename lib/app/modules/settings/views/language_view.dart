import 'package:financial_controlee_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class LanguageView extends GetView {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
        centerTitle: true,
      ),
      body: GetBuilder<SettingsController>(
        init: Get.find<SettingsController>(),
        builder: (c) {
          return Column(
            children: [
              GFSearchBar(
                  searchList: c.list,
                  searchQueryBuilder: (query, List<Locale> list) {
                    return list
                        .where((item) => item.languageCode
                            .toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  },
                  overlaySearchListItemBuilder: (data) {
                    var item = data as Locale;
                    var country = (item.countryCode != null)
                        ? '- ${item.countryCode}'
                        : '';
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '${LocaleNames.of(context)?.nameOf(item.languageCode)} $country',
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  },
                  onItemSelected: (locale) {
                    print(locale);
                  }),
              Expanded(
                child: ListView.builder(
                  itemCount: c.list.length,
                  itemBuilder: (_, index) {
                    var item = c.list[index];
                    var country = (item.countryCode != null)
                        ? '- ${item.countryCode}'
                        : '';
                    return GFRadioListTile(
                        title: Text(
                            '${LocaleNames.of(context)?.nameOf(item.languageCode)} $country'),
                        value: item,
                        size: GFSize.LARGE,
                        type: GFRadioType.basic,
                        groupValue: c.groupValue.value,
                        onChanged: (val) {
                          c.changeLanguage(val as Locale);
                        });
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
