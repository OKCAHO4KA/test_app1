import 'package:flutter/material.dart';
import 'package:test_app1/config/resources/app_constants.dart';
import 'package:test_app1/config/theme/ui_themes.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget({
    required this.title,
    required this.onTap,
    this.errorMessage = '',
    this.isLoading,
    super.key,
  });

  final String title;
  final String errorMessage;
  final Function onTap;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            (isLoading ?? false) ? null : onTap.call();
          },
          child: Container(
            width: AppConstants.widtButton,
            height: AppConstants.heightButton,
            decoration: BoxDecoration(
              color: isLoading ?? false ? theme.whiteGreen : theme.greenDark50,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isLoading ?? false
                    ? theme.greenDark20
                    : theme.greenDark50,
                width: 2,
              ),
            ),
            child: isLoading ?? false
                ? Center(
                    child: CircularProgressIndicator(
                      color: theme.greenDark20,
                      strokeWidth: 2,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                errorMessage.isEmpty
                                    ? title
                                    : "Повторить попытку",
                                style: isLoading ?? false
                                    ? theme.getBold16Green20(context)
                                    : theme.getBold16White(context),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
        if (errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(errorMessage, style: theme.getBold16Red(context)),
          ),
      ],
    );
  }
}
