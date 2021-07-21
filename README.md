# Countries GraphQL Mobile Client

A test flutter application, implementing https://www.everbase.co GraphQL api. Personal API key is available in the code for convenience, will be revoked soon.
CI workflow for testing, analyzing and building can be found in github workflows.

## Getting Started

The project was built with Flutter 2.2.3 with sound null-safety.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# How to run
 
 This is a step by step guide on how to build and run the project on iOS and Android

## Testing

Tests are defined in ```./test/app_test.dart```
Running ```flutter test``` in the project root will start the test process and return the results.

## iOS

You can open ```ios/Runner.xcworkspace``` in Xcode and build the project as usual.
Note that you need to assign a development team and change the bundle id accordingly.

After setting up the XCode requirements, you can run 
```flutter run``` in the project root.
while having a simulator or a physical device connected.

For building for iOS you can run :
```flutter build ios```

## Android

No extra setup required, just run ```flutter run``` for debug or ```flutter build appbundle``` for building in the project root.

# Issues
Everbase does not return all of the capital cities correctly therefore you might see some blank spaces instead of Capital city names for some countries.
Everbase Private Api key is hardcoded in the code for testing purposes, in production this is not a good practice and would be stored in an .env or a remote database for security.

# CI Workflow
For demonstration purposes, any commit made to the master channel on this repository will initialize the GitHub action, found in ```./.github/workflows/ci.yml```
This will test and analyze the code, and in case of success tries building iOS and Android version of the project.



