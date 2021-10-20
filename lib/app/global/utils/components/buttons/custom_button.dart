import '../../widgets/loading_view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final void Function()? onPressed;

  const CustomButton(
      {Key? key, this.isLoading = false, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.only(top: 3, left: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border(
            bottom:
                BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black),
            top:
                BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black),
            left:
                BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black),
            right:
                BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black),
          ),
        ),
        child: MaterialButton(
          key: UniqueKey(),
          minWidth: double.infinity,
          height: 60,
          onPressed: isLoading ? null : onPressed,
          color: isLoading
              ? Theme.of(context).primaryColor.withOpacity(.4)
              : Theme.of(context).primaryColor,
          // textTheme: Theme.of(context).butt,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: isLoading
              ? LoadingView()
              : Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                ),
        ),
      ),
    );
  }
}
