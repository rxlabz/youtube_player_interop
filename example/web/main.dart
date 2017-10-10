import 'dart:html';

import 'package:js/js.dart';
import 'package:youtube_player_interop/youtube_player_interop.dart' as yt;

yt.Player player;

InputElement fldVideoId;
ButtonElement btLoad;
ButtonElement btPlay;
ButtonElement btPause;
ButtonElement btStop;

DivElement playerOptions;
DivElement videoControls;

CheckboxInputElement chkControls;
CheckboxInputElement chkInfos;
CheckboxInputElement chkAutoplay;

bool showControls = true;
bool showInfos = true;
bool autoplay = false;

void main() {
  yt.initYoutubeFrame(showPlayer);
}

void showPlayer() {
  querySelector('#container').classes.remove('disabled');

  playerOptions = querySelector('#playerOptions');
  videoControls = querySelector('#videoControls');

  fldVideoId = querySelector('#fldVideoId');

  btLoad = querySelector('#btLoad')
    ..onClick.listen((e) => loadPlayer(fldVideoId.value));

  btPlay = querySelector('#btPlay')..onClick.listen((e) => player.playVideo());

  btPause = querySelector('#btPause')
    ..onClick.listen((e) => player.pauseVideo());

  btStop = querySelector('#btStop')..onClick.listen((e) => player.stopVideo());

  chkControls = querySelector('#chkControls')
    ..onChange.listen((e) {
      showControls = chkControls.checked;
      clear();
      loadPlayer(fldVideoId.value);
    });

  chkInfos = querySelector('#chkInfos')
    ..onChange.listen((e) {
      showInfos = chkInfos.checked;
      clear();
      loadPlayer(fldVideoId.value);
    });

  chkAutoplay = querySelector('#chkAutoplay')
    ..onChange.listen((e) {
      autoplay = chkAutoplay.checked;
      clear();
      loadPlayer(fldVideoId.value);
    });
}

void clear() {
  player.stopVideo();
  player.destroy();
}

void loadPlayer(String videoId) {
  print('loadPlayer... $videoId');
  var options = new yt.PlayerOptions(
    height: '360',
    width: '480',
    videoId: videoId,
    playerVars: new yt.PlayerVars(
      controls: showControls ? 1 : 0,
      showinfo : showInfos ? 1 : 0,
      autoplay : autoplay ? 1 : 0,
    ), events: new yt.Events(onReady: allowInterop(onPlayerReady)));
  player = new yt.Player('video', options);
}

void onPlayerReady(dynamic e){
  playerOptions.classes.remove('disabled');
  videoControls.classes.remove('disabled');
}

//var player;
/*void onYouTubeIframeAPIReady() {
  print('onYouTubeIframeAPIReady... ');
  var options = new PlayerOptions(
    height: '360',
    width: '480',
    videoId: 'M7lc1UVf-VE',
  );
  var player = new Player('video', options);
  print('onYouTubeIframeAPIReady... ${player}');
}*/
