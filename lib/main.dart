import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(title:'HNG Links'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (await url_launcher.canLaunch(url.toString())) {
        await url_launcher.launch(url.toString(), forceSafariVC: false, forceWebView: false);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error launching URL: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HNG Links'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _launchURL('https://github.com/Simonyano/mobilezero'),
              icon: const Icon(Icons.code),
              label: const Text('GitHub Repository'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchURL('https://hng.tech/hire-flutter-developers'),
              child: const Text('HNG Flutter Developers'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL('https://hng.tech/hire/react-native-developers'),
              child: const Text('HNG React-Native Developers'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL('https://hng.tech/hire/mobile-ui-ux-developers'),
              child: const Text('HNG UI-UX'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL('https://hng.tech/hire/kotlin-developers'),
              child: const Text('HNG Kotlin Developers'),
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL('https://hng.tech/hire-mobile-developers'),
              child: const Text('HNG Mobile Developers'),
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL('https://hng.tech/hire/android-developers'),
              child: const Text('HNG Android Developers'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL('https://hng.tech/hire/ios-developers'),
              child: const Text('HNG iOS Developers'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL('https://telex.im'),
              child: const Text('Telex'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL('https://delve.fun'),
              child: const Text('Delve'),
            ),
          ],
        ),
      ),
    );
  }
}