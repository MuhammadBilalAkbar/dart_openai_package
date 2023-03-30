import 'dart:io';

import 'package:dart_openai/openai.dart';
import 'env/env.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  OpenAI.apiKey = Env.apiKey;

  final transcription = OpenAI.instance.audio.createTranscription(
    file: await getFileFromUrl(
      'https://www.cbvoiceovers.com/wp-content/uploads/2017/05/Commercial-showreel.mp3',
    ),
    model: 'whisper-1',
  );
  print(transcription);
}

Future<File> getFileFromUrl(String networkUrl) async {
  final response = await http.get(Uri.parse(networkUrl));
  final uniqueImageName = DateTime.now().microsecondsSinceEpoch;
  final file = File('$uniqueImageName.mp3');
  await file.writeAsBytes(response.bodyBytes);
  return file;
}
