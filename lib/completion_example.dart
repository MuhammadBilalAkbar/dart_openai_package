import 'package:dart_openai/openai.dart';
import '/env/env.dart';

Future<void> main() async {
  OpenAI.apiKey = Env.apiKey;

  final completion = await OpenAI.instance.completion.create(
    model: 'text-davinci-003',
    prompt: 'Dart is',
  );
  print(completion.choices.first.text);
}
