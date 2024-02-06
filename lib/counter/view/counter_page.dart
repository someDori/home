import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_app/counter/counter.dart';
import 'package:home_app/l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(
        child: Center(
          child: OutlinedButton(
            onPressed: _launchURL,
            child: Text('Chuck Norris jokes app'),
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  final url = Uri.parse('https://flutter.dev');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
