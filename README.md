# Artuaista

Find your new favorite wallpaper that looks just like you.

<p float="left">
  <img src="https://github.com/bleszerd/Artuaista/blob/main/.github/artuaista_screenshot_001.png?raw=true" width="140" />
  <img src="https://github.com/bleszerd/Artuaista/blob/main/.github/artuaista_screenshot_002.png?raw=true" width="140" />
  <img src="https://github.com/bleszerd/Artuaista/blob/main/.github/artuaista_screenshot_003.png?raw=true" width="140" />
  <img src="https://github.com/bleszerd/Artuaista/blob/main/.github/artuaista_screenshot_004.png?raw=true" width="140" />
</p>

# Builds

The pre-built app can be downloaded under "releases" on the right side of this page

# How to compile

```
$ git clone https://github.com/bleszerd/Wollpaper.git
```

Create a new `.env` file and put your [Pexels Api](https://www.pexels.com/pt-br/api/) key like this:

```
PEXELS_API_KEY="AS596G4SJ91AE4F4G941A9E8"
```

```
flutter pub get
flutter build apk
```

Navigate to `[project]/build/app/outputs/apk/release/` to see your APK (Android Package Kit).

**Done!**
