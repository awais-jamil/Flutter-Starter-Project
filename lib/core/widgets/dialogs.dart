import 'package:mobile_app/utills/app_colors.dart';
import 'package:mobile_app/utills/common_barrel.dart';

class Dialogs {
  Dialogs(this.context);

  factory Dialogs.of(BuildContext context) => Dialogs(context);

  final BuildContext context;

  Future showSingleButtonDialog({
    required String title,
    required String message,
    required String buttonTitle,
    bool showCancelButton = true,
    bool showActionButton = true,
    VoidCallback? onActionButtonPressed,
  }) =>
      showGeneralSingleButtonDialog(
        title: title,
        buttonTitle: buttonTitle,
        barrierDismissible: showCancelButton,
        showCancelButton: showCancelButton,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: 20),
            // const Spacer(),
            if (showActionButton)
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 75,
                  child: Builder(
                    builder: (context) {
                      return TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.purpleColors.first,
                          primary: AppColors.greyColors.last,
                        ),
                        onPressed: () {
                          if (onActionButtonPressed != null) {
                            onActionButtonPressed();
                          }
                          Navigator.pop(
                            context,
                            true,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            buttonTitle,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColors.greyColors.last,
                                    ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
          ],
        ),
      );

  Future showGeneralDialog({
    required Widget child,
    bool showCancelButton = true,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: showCancelButton,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(true),
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: child,
                ),
              ),
            ),
          );
        },
      );

  Future showGeneralSingleButtonDialog({
    required String title,
    required String buttonTitle,
    required Widget child,
    bool showCancelButton = true,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            const SizedBox(height: 20),
            child,
          ],
        ),
      );
}
