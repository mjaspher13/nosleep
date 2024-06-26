import 'dart:ffi';
import 'package:ffi/ffi.dart';

// Constants for SetThreadExecutionState
const ES_CONTINUOUS = 0x80000000;
const ES_SYSTEM_REQUIRED = 0x00000001;
const ES_DISPLAY_REQUIRED = 0x00000002;

typedef SetThreadExecutionStateC = Uint32 Function(Uint32 esFlags);
typedef SetThreadExecutionStateDart = int Function(int esFlags);

class SleepPrevention {
  late DynamicLibrary _kernel32;
  late SetThreadExecutionStateDart _setThreadExecutionState;

  SleepPrevention() {
    _kernel32 = DynamicLibrary.open('kernel32.dll');
    _setThreadExecutionState = _kernel32.lookupFunction<
        SetThreadExecutionStateC,
        SetThreadExecutionStateDart>('SetThreadExecutionState');
  }

  void preventSleep() {
    _setThreadExecutionState(
        ES_CONTINUOUS | ES_SYSTEM_REQUIRED | ES_DISPLAY_REQUIRED);
  }

  void allowSleep() {
    _setThreadExecutionState(ES_CONTINUOUS);
  }
}
