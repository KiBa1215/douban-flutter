
part of 'common.dart';

class DeviceInfo {

  static String operatingSystem() {
    return Platform.operatingSystem;
  }

  static String osVersion() {
    return Platform.operatingSystemVersion;
  }
}