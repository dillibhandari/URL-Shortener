import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_shorter/core/utils.dart/dimens.dart';
import 'package:url_shorter/core/utils.dart/app_utils.dart';
import 'package:url_shorter/core/common_widgets/top_snack_bar.dart';
import 'package:url_shorter/feature/url_generator/presentation/bloc/url_shorter_bloc.dart';

class QrViewWidget extends StatelessWidget {
  const QrViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UrlShorterBloc, UrlShorterState>(
      listener: (context, state) {
        if (state is UrlShorterFailed) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: state.exception.errorMessage),
          );
        } else if (state is UrlShorterSuccess) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(message: "Thank you so much !!!"),
          );
        }
      },
      builder: (context, state) {
        if (state is UrlShorterSuccess) {
          return Column(children: [
            Text(state.shortUrl),
            SizedBox(height: sizeX20 * Utils.getScalingFactor(context)),
            QrImageView(
              data: state.shortUrl,
              version: QrVersions.auto,
              size: 200 * Utils.getScalingFactor(context),
            ),
          ]);
        } else if (state is UrlShorterLoading) {
          return const Center(child: Text("Please Wait ..... "));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
