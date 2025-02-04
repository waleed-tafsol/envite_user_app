//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<file_picker/FilePickerPlugin.h>)
#import <file_picker/FilePickerPlugin.h>
#else
@import file_picker;
#endif

#if __has_include(<flutter_google_places_sdk_ios/SwiftFlutterGooglePlacesSdkIosPlugin.h>)
#import <flutter_google_places_sdk_ios/SwiftFlutterGooglePlacesSdkIosPlugin.h>
#else
@import flutter_google_places_sdk_ios;
#endif

#if __has_include(<geolocator_apple/GeolocatorPlugin.h>)
#import <geolocator_apple/GeolocatorPlugin.h>
#else
@import geolocator_apple;
#endif

#if __has_include(<get_thumbnail_video/VideoThumbnailPlugin.h>)
#import <get_thumbnail_video/VideoThumbnailPlugin.h>
#else
@import get_thumbnail_video;
#endif

#if __has_include(<image_picker_ios/FLTImagePickerPlugin.h>)
#import <image_picker_ios/FLTImagePickerPlugin.h>
#else
@import image_picker_ios;
#endif

#if __has_include(<myfatoorah_flutter/MyfatoorahFlutterPlugin.h>)
#import <myfatoorah_flutter/MyfatoorahFlutterPlugin.h>
#else
@import myfatoorah_flutter;
#endif

#if __has_include(<package_info_plus/FPPPackageInfoPlusPlugin.h>)
#import <package_info_plus/FPPPackageInfoPlusPlugin.h>
#else
@import package_info_plus;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

#if __has_include(<shared_preferences_foundation/SharedPreferencesPlugin.h>)
#import <shared_preferences_foundation/SharedPreferencesPlugin.h>
#else
@import shared_preferences_foundation;
#endif

#if __has_include(<video_player_avfoundation/FVPVideoPlayerPlugin.h>)
#import <video_player_avfoundation/FVPVideoPlayerPlugin.h>
#else
@import video_player_avfoundation;
#endif

#if __has_include(<wakelock_plus/WakelockPlusPlugin.h>)
#import <wakelock_plus/WakelockPlusPlugin.h>
#else
@import wakelock_plus;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FilePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FilePickerPlugin"]];
  [SwiftFlutterGooglePlacesSdkIosPlugin registerWithRegistrar:[registry registrarForPlugin:@"SwiftFlutterGooglePlacesSdkIosPlugin"]];
  [GeolocatorPlugin registerWithRegistrar:[registry registrarForPlugin:@"GeolocatorPlugin"]];
  [VideoThumbnailPlugin registerWithRegistrar:[registry registrarForPlugin:@"VideoThumbnailPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [MyfatoorahFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"MyfatoorahFlutterPlugin"]];
  [FPPPackageInfoPlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FPPPackageInfoPlusPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
  [SharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"SharedPreferencesPlugin"]];
  [FVPVideoPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FVPVideoPlayerPlugin"]];
  [WakelockPlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"WakelockPlusPlugin"]];
}

@end
