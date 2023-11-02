abstract class SignInEvents {
  const SignInEvents();
}

class EmailEvents extends SignInEvents {
  final String email;
  EmailEvents(this.email);
}

class PasswordEvents extends SignInEvents {
  final String password;
  PasswordEvents(this.password);
}
