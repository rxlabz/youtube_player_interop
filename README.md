# youtube_player_interop

A [Youtube iFrame API](https://developers.google.com/youtube/player_parameters) wrapper for Dart web apps

For Angular Dart apps see the [Youtube iFrame Component](https://github.com/rxlabz/angular_youtube_iframe)

## Example

[Example](https://rxlabz.github.io/youtube_player_interop)

The simplest example

### HTML

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>youtube iframe interop</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="favicon.ico">
    <script defer src="main.dart" type="application/dart"></script>
    <script defer src="packages/browser/dart.js"></script>
</head>
<body>
    <div id="video"></div>
</body>
</html>

```

### Dart

```dart
import 'package:youtube_player_interop/youtube_player_interop.dart' as yt;

void main(){
  yt.initYoutubeFrame(onYouTubeIframeAPIReady);
}

void onYouTubeIframeAPIReady() {
  final options = new yt.PlayerOptions(
    height: '360',
    width: '480',
    videoId: 'JXcNqXbCa0E',
  );
  final player = new yt.Player('video', options);
}
```

## API

- [player](https://developers.google.com/youtube/iframe_api_reference)
- [playerVars](https://developers.google.com/youtube/player_parameters)

### Events

- onReady
- onStateChange
- onPlaybackQualityChange
- onPlaybackRateChange
- onError