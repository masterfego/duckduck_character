# Character Viewer

A multi variant character viewer app.

- Simpson character viewer
- The Wire character viewer

## Get Started

Go in the root of the project and run these commands:

```sh
./get_all.sh # run pub get in all packages
./generate_all.sh # generate the files in all packages

```

## Running the apps

The repo already inclure the VSCode launch options in the `.vscode` folder.

To run manually the app:

```sh
cd packages/apps/simpsonviewer/
flutter run # choose your device

#or
cd packages/apps/wireviewer/
flutter run # choose your device

```

## Testing

(Optional) To update the golden files:

```sh
./update_golden.sh

```

To run the unit test:

```sh
./test_all.sh

```
