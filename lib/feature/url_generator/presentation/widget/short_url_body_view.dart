import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shorter/core/utils.dart/dimens.dart';
import 'package:url_shorter/core/utils.dart/app_utils.dart';
import 'package:url_shorter/core/utils.dart/app_colors.dart';
import 'package:url_shorter/core/common_widgets/custom_button_widget.dart';
import 'package:url_shorter/core/common_widgets/custom_text_field.dart';
import 'package:url_shorter/feature/url_generator/domain/usecase/url_shorter_usecase.dart';
import 'package:url_shorter/feature/url_generator/presentation/bloc/url_shorter_bloc.dart';
import 'package:url_shorter/feature/url_generator/presentation/widget/qr_view_widget.dart';

class ShortUrlBodyView extends StatefulWidget {
  const ShortUrlBodyView({super.key});

  @override
  State<ShortUrlBodyView> createState() => _ShortUrlBodyViewState();
}

class _ShortUrlBodyViewState extends State<ShortUrlBodyView> {
  final GlobalKey<FormState> _urlShorterFormKey = GlobalKey<FormState>();
  final TextEditingController _urlShorterUrlTextEditingController =
      TextEditingController(
          text:
              "https://api.rebrandly.com/v1/links?orderBy=createdAt&orderDir=desc&limit=25");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _urlShorterFormKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.all(18.0 * Utils.getScalingFactor(context)),
              child: CustomTextFormField(
                hintText: "Please Enter Valid Long Url",
                textInputType: TextInputType.text,
                validator: (value) => Utils.validate(value, field: "url"),
                autofocus: false,
                textStyle: TextStyle(
                    fontSize: fontBodyTextLarge, color: AppColors.black50),
                hintStyle: TextStyle(
                    fontSize: fontBodyTextMedium, color: AppColors.black50),
                controller: _urlShorterUrlTextEditingController,
              ),
            ),
            SizedBox(height: sizeX10 * Utils.getScalingFactor(context)),
            const QrViewWidget(),
            SizedBox(height: sizeX10 * Utils.getScalingFactor(context)),
            CustomButton(
              height: sizeX50 * Utils.getScalingFactor(context),
              width: sizeX250 * Utils.getScalingFactor(context),
              text: "Get Short Url",
              onPressed: () {
                if (_urlShorterFormKey.currentState!.validate()) {
                  UrlShorterParams params = UrlShorterParams(
                      url: _urlShorterUrlTextEditingController.text);
                  context.read<UrlShorterBloc>().add(UrlShorterFetch(params));
                }
              },
              buttonStyle: CustomButtonStyles.fillBlueGray.copyWith(
                backgroundColor: MaterialStatePropertyAll(AppColors.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
