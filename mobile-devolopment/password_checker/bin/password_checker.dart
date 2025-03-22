import 'package:args/args.dart';
import 'password_utils.dart';

const String version = '0.0.1';

ArgParser buildParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    )
    ..addFlag(
      'verbose',
      abbr: 'v',
      negatable: false,
      help: 'Show additional command output.',
    )
    ..addFlag(
      'version',
      negatable: false,
      help: 'Print the tool version.',
    )
    ..addOption(
      'check-password-strength',
      abbr: 'p',
      help: 'Check the strength of a password.',
    )
    ..addOption(
      'generate-password',
      abbr: 'g',
      help: 'Generate a password of the specified strength.',
      allowed: ['strong', 'intermediate', 'low'],
    );
}

void printUsage(ArgParser argParser) {
  print('Usage: dart password_checker.dart <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> arguments) {
  final ArgParser argParser = buildParser();
  final PasswordUtility passwordUtility = PasswordUtility();
  try {
    final ArgResults results = argParser.parse(arguments);
    bool verbose = false;

    // Process the parsed arguments.
    if (results.flag('help')) {
      printUsage(argParser);
      return;
    }
    if (results.flag('version')) {
      print('password_checker version: $version');
      return;
    }
    if (results.flag('verbose')) {
      verbose = true;
    }
    if (results.options.contains('check-password-strength')) {
      final strength =
          passwordUtility.validatePassword(results['check-password-strength']);
      print('Password strength: $strength');
    }
    if (results.options.contains('generate-password')) {
      final password =
          passwordUtility.generatePassword(results['generate-password']);
      print('Generated password: $password');
    }

    // Act on the arguments provided.
    // print('Positional arguments: ${results.rest}');
    if (verbose) {
      print('[VERBOSE] All arguments: ${results.arguments}');
    }
  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    printUsage(argParser);
  }
}
