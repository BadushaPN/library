import 'package:bookapp/view/home_page.dart';
import 'package:bookapp/view/widgets/background.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Please verify your email address',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'We have sent a verification code to your email address.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Verification Code',
                  hintText: 'Enter the code sent to your email',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add logic to verify the code
                  // You may navigate to the next screen upon successful verification
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    (route) =>
                        false, // Remove all previous routes from the stack
                  );
                  //
                  // or show an error message if verification fails
                },
                child: Text('Verify'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Navigate to a new screen, replacing the current stack
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    (route) =>
                        false, // Remove all previous routes from the stack
                  );
                  // Add logic to resend the verification code
                  // This could trigger sending another email with a new code
                  // or show a message that the code has been resent
                },
                child: Text('Resend Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
