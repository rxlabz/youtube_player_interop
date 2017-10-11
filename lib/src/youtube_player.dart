@JS('YT')
library yt;

import 'package:js/js.dart';
import 'package:meta/meta.dart';

@JS('Player')

/// https://developers.google.com/youtube/iframe_api_reference#Functions
class Player {
  external factory Player(String id, PlayerOptions options);

  external String get id;
  external String get width;
  external String get height;
  external String get videoId;

  external void loadVideoById(VideoByIdParams params);

  external void cueVideoById(VideoByIdParams params);

  external void loadVideoByUrl(VideoByUrlParams params);

  external void cueVideoByUrl(VideoByUrlParams params);

  external dynamic playVideo();
  external dynamic pauseVideo();
  external dynamic stopVideo();
  external dynamic seekTo(int seconds, int allowSeekAhead);
  external dynamic clearVideo();

  external EventArgs addEventListener(String event, dynamic listener);
  external void removeEventListener(String event, dynamic listener);

  external double getVideoLoadedFraction();
  external int getCurrentTime();
  external int getDuration();

  /// -1 not started , 0 stopped , 1 playing, 2 paused, 3, buffering, 5 queued
  external int getPlayerState();

  external String getPlaybackQuality();
  external void setPlaybackQuality(String suggestedQuality);
  external List<String> getAvailableQualityLevels();

  external void mute();
  external void unMute();
  external bool isMuted();
  external void setVolume(int volum);
  external int getVolume();

  external String getVideoUrl();
  external String getVideoEmbedCode();

  external dynamic setSize(int width, int height);

  external dynamic getIframe();
  external void destroy();

  external num getPlaybackRate();
  external List<num> getAvailablePlaybackRates();
  external dynamic setPlaybackRate(num);

  external List<String> getPlaylist();
  external int getPlaylistIndex();

  external void nextVideo();
  external void previousVideo();
  external void playVideoAt(int index);

  external void setLoop(bool loopPlaylists);
  external void setShuffle(bool shufflePlaylist);
}

@JS()
@anonymous

/// https://developers.google.com/youtube/iframe_api_reference#Loading_a_Video_Player
class PlayerOptions {
  external String get width;
  external String get height;
  external String get videoId;
  external PlayerVars get playerVars;
  external Events get events;
  external factory PlayerOptions({
    String width,
    String height,
    String videoId,
    PlayerVars playerVars,
    Events events,
  });
}

@JS()
@anonymous

/// https://developers.google.com/youtube/player_parameters
class PlayerVars {
  external int get autoplay;
  external int get cc_load_policy;
  external String get color;
  external int get controls;
  external int get disablekb;
  external int get enablejsapi;
  external int get end;
  external int get fs;
  external int get iv_load_policy;
  external String get list;
  external dynamic get listType;
  external int get loop;
  external int get modestbranding;
  external String get origin;
  external String get playerpiid;
  external List<String> get playlist;
  external int get playsinline;
  external int get rel;
  external int get showinfo;
  external int get start;

  external factory PlayerVars({
    int autoplay,
    int cc_load_policy,
    String color,
    int controls,
    int disablekb,
    int enablejsapi,
    int end,
    int fs,
    int iv_load_policy,
    String list,
    String listType,
    int loop,
    int modestbranding,
    int origin,
    List<String> playlist,
    int playsinline,
    int rel,
    int showinfo,
    int start,
  });
}

@JS()
@anonymous

/// https://developers.google.com/youtube/iframe_api_reference#Queueing_Functions
class VideoByIdParams {
  external factory VideoByIdParams(
      {String videoId,
      int startSeconds,
      int endSeconds,
      String suggestedQuality = YTQuality.auto});
  external String get videoId;
  external int get startSeconds;
  external int get endSeconds;
  external String get suggestedQuality;
}

@JS()
@anonymous

/// https://developers.google.com/youtube/iframe_api_reference#Queueing_Functions
class VideoByUrlParams {
  external factory VideoByUrlParams({
    @required String mediaContentUrl,
    int startSeconds = 0,
    String suggestedQuality = YTQuality.auto,
    int endSeconds,
  });
  external String get videoId;
  external int get startSeconds;
  external int get endSeconds;
  external String get suggestedQuality;
}

typedef void EventHandler(EventArgs eventArgs);

@JS()
@anonymous

/// https://developers.google.com/youtube/iframe_api_reference
class Events {
  external EventHandler get onReady;
  external EventHandler get onStateChange;
  external EventHandler get onPlaybackQualityChange;
  external EventHandler get onPlaybackRateChange;
  external EventHandler get onError;

  external factory Events({
    EventHandler onReady,
    EventHandler onStateChange,
    EventHandler onPlaybackQualityChange,
    EventHandler onPlaybackRateChange,
    EventHandler onError,
  });
}

@JS()
@anonymous
class EventArgs {
  external Player get target;
  external dynamic get data;
  external factory EventArgs({Player target, dynamic data});
}

class YTQuality {
  static const small = 'small'; // 320*240
  static const medium = 'medium'; // 640 * 360
  static const large = 'large'; // 853*480
  static const hd720 = 'hd720'; // 1280*720
  static const hd1080 = 'hd1080'; // 1920*1080
  static const highres = 'highres'; // > 1920*1080
  static const auto = 'default';
}

/// -1 not started , 0 stopped , 1 playing, 2 paused, 3, buffering, 5 queued
enum PlayerState{
  notStarted, stopped, playing, paused, buffering, queued
}

PlayerState stateFromInt(int value){
  switch (value) {
    case -1:
      return PlayerState.notStarted;
      break;
    case 0:
      return PlayerState.stopped;
      break;
    case 1:
      return PlayerState.playing;
      break;
    case 2:
      return PlayerState.paused;
      break;
    case 3:
      return PlayerState.buffering;
      break;
    case 5:
      return PlayerState.queued;
      break;
    default:

  }
}
