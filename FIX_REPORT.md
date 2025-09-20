# Automatic Scan & Fix Report

This archive was unpacked and scanned automatically. I made no destructive changes to your original files. Instead I included this report (`FIX_REPORT.md`) and a suggested `codemagic_suggested.yaml` template.

**What I did:**
- Unzipped your `AAAAA.zip` into `AAAAA_unpacked/`
- Scanned for common Flutter / CI files (codemagic, pubspec.yaml, gradle, AndroidManifest)
- Collected file heads and produced suggestions for fixes.


## Files found (top-level view)

- aAaaaaahahahahaqaa.Zip/README.md
- aAaaaaahahahahaqaa.Zip/android/app/src/main/AndroidManifest.xml
- aAaaaaahahahahaqaa.Zip/assets/animations/confetti.json
- aAaaaaahahahahaqaa.Zip/assets/animations/welcome.json
- aAaaaaahahahahaqaa.Zip/assets/images/board.png
- aAaaaaahahahahaqaa.Zip/assets/images/dice_1.png
- aAaaaaahahahahaqaa.Zip/assets/images/dice_2.png
- aAaaaaahahahahaqaa.Zip/assets/images/dice_3.png
- aAaaaaahahahahaqaa.Zip/assets/images/dice_4.png
- aAaaaaahahahahaqaa.Zip/assets/images/dice_5.png
- aAaaaaahahahahaqaa.Zip/assets/images/dice_6.png
- aAaaaaahahahahaqaa.Zip/assets/images/dice_skin_1.png
- aAaaaaahahahahaqaa.Zip/assets/images/dice_skin_2.png
- aAaaaaahahahahaqaa.Zip/assets/images/neon_button.png
- aAaaaaahahahahaqaa.Zip/assets/images/token_alt_blue.png
- aAaaaaahahahahaqaa.Zip/assets/images/token_alt_green.png
- aAaaaaahahahahaqaa.Zip/assets/images/token_alt_red.png
- aAaaaaahahahahaqaa.Zip/assets/images/token_alt_yellow.png
- aAaaaaahahahahaqaa.Zip/assets/images/token_blue.png
- aAaaaaahahahahaqaa.Zip/assets/images/token_green.png
- aAaaaaahahahahaqaa.Zip/assets/images/token_red.png
- aAaaaaahahahahaqaa.Zip/assets/images/token_yellow.png
- aAaaaaahahahahaqaa.Zip/assets/sounds/bg_music.mp3
- aAaaaaahahahahaqaa.Zip/assets/sounds/bg_music.wav
- aAaaaaahahahahaqaa.Zip/assets/sounds/dice_roll.mp3
- aAaaaaahahahahaqaa.Zip/assets/sounds/dice_roll.wav
- aAaaaaahahahahaqaa.Zip/assets/sounds/win.mp3
- aAaaaaahahahahaqaa.Zip/assets/sounds/win.wav
- aAaaaaahahahahaqaa.Zip/codemagic.yaml
- aAaaaaahahahahaqaa.Zip/lib/config/gemini_config.dart
- aAaaaaahahahahaqaa.Zip/lib/main.dart
- aAaaaaahahahahaqaa.Zip/lib/screens/chat_screen.dart
- aAaaaaahahahahaqaa.Zip/lib/screens/customize_screen.dart
- aAaaaaahahahahaqaa.Zip/lib/screens/ludo_screen.dart
- aAaaaaahahahahaqaa.Zip/lib/screens/profile_screen.dart
- aAaaaaahahahahaqaa.Zip/lib/screens/welcome_screen.dart
- aAaaaaahahahahaqaa.Zip/lib/theme/neon_theme.dart
- aAaaaaahahahahaqaa.Zip/prompts/100_prompts.txt
- aAaaaaahahahahaqaa.Zip/pubspec.yaml


## codemagic files found

---
### aAaaaaahahahahaqaa.Zip/codemagic.yaml

File head (first ~200 lines):

```

workflows:
  build_android:
    name: Build Android
    instance_type: mac_mini_m1
    environment:
      flutter: stable
      xcode: latest
    variables:
      PACKAGE_NAME: com.siraakichokrri.birhmani_ai_ludo
      BUILD_NUMBER: "{{timestamp}}"
    scripts:
      - name: Flutter doctor
        script: |
          flutter doctor -v
      - name: Get packages
        script: |
          flutter pub get
      - name: Run tests
        script: |
          flutter test || true
      - name: Build Android AAB
        script: |
          flutter build appbundle --release
    artifacts:
      - build/app/outputs/**/*.aab
      - build/app/outputs/**/*.apk
    publishing:
      email:
        recipients:
          - your.email@example.com

  build_ios:
    name: Build iOS
    instance_type: mac_mini_m1
    environment:
      flutter: stable
      xcode: latest
    variables:
      APP_STORE_APPLE_ID: your.apple.id
      BUILD_NUMBER: "{{timestamp}}"
    scripts:
      - name: Get packages
        script: |
          flutter pub get
      - name: Pod install
        script: |
          cd ios && pod install
      - name: Build iOS IPA
        script: |
          flutter build ipa --release
    artifacts:
      - build/ios/*.ipa
    publishing:
      testflight:
        enabled: true


```



## pubspec.yaml files found

---
### aAaaaaahahahahaqaa.Zip/pubspec.yaml
```
name: birhmani_ai_ludo
description: Birhmani AI Ludo - Utraadi Ludo (Black neon themed Ludo with Gemini AI integration)
publish_to: 'none'
version: 1.0.0+1
environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.5
  flame: ^1.18.0
  audioplayers: ^6.1.0
  google_generative_ai: ^0.4.0
  shared_preferences: ^2.3.2
  lottie: ^3.1.2
  provider: ^6.0.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
  assets:
    - assets/images/board.png
    - assets/images/token_red.png
    - assets/images/token_blue.png
    - assets/images/token_green.png
    - assets/images/token_yellow.png
    - assets/images/dice_1.png
    - assets/images/dice_2.png
    - assets/images/dice_3.png
    - assets/images/dice_4.png
    - assets/images/dice_5.png
    - assets/images/dice_6.png
    - assets/images/neon_button.png
    - assets/images/token_alt_red.png
    - assets/images/token_alt_blue.png
    - assets/images/token_alt_green.png
    - assets/images/token_alt_yellow.png
    - assets/images/dice_skin_1.png
    - assets/images/dice_skin_2.png
    - assets/animations/welcome.json
    - assets/animations/confetti.json
    - assets/sounds/dice_roll.mp3
    - assets/sounds/win.mp3
    - assets/sounds/bg_music.mp3

```



## Heuristic checks & suggestions
