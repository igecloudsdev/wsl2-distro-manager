import 'package:fluent_ui/fluent_ui.dart';
import 'api.dart';

dialog({
  required BuildContext context,
  required item,
  required WSLApi api,
  required Function statusMsg,
  required onSubmit,
  String title = '',
  String body = '',
  String submitText = '',
  ButtonStyle submitStyle = const ButtonStyle(),
  bool submitInput = true,
}) {
  final controller = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return ContentDialog(
        title: Text(title),
        content: Column(
          children: [
            Text(body),
            submitInput
                ? Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextBox(
                      controller: controller,
                      placeholder: item,
                    ),
                  )
                : const Text(''),
          ],
        ),
        actions: [
          Button(
              child: Text(submitText),
              style: submitStyle,
              onPressed: () async {
                Navigator.pop(context);
                onSubmit(controller.text);
              }),
          Button(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      );
    },
  );
}