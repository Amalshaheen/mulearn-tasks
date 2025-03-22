A sample command-line application providing basic argument parsing with an entrypoint in `bin/`.

## Usage

### Checking Password Strength

**Input:**
```
dart run bin/password_checker.dart --check-password-strength 'aMaL!@##%1234'
```

**Output:**
```
Password strength: Strong
```

### Generating a Password

**Input (Low Strength):**
```bash
dart run bin/password_checker.dart --generate-password low
```

**Output:**
```
Generated password: brzdkc
```

**Input (Intermediate Strength):**
```bash
dart run bin/password_checker.dart --generate-password intermediate
```

**Output:**
```
Generated password: 4XFxaSo3
```

**Input (Strong Strength):**
```bash
dart run bin/password_checker.dart --generate-password strong
```

**Output:**
```
Generated password: @Y~tVXa39Kst
```
