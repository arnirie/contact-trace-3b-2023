import 'package:contact_trace_3b/constants/style_constants.dart';
import 'package:contact_trace_3b/screens/register_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              alignment: Alignment.bottomCenter,
              opacity: 0.7,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contact Trace',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('A contact tracing app for students of Mobile App Dev 2',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                'Welcome! Please login or signup.',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 12.0,
              ),
              // Image.asset('assets/images/background.png'),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: roundShape,
                ),
                child: const Text('Login'),
              ),
              OutlinedButton(
                onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const RegisterClientScreen(),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  shape: roundShape,
                ),
                child: const Text('Sign Up as Client'),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: roundShape,
                  backgroundColor: Colors.white60,
                ),
                child: const Text('Sign Up as Establishment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
