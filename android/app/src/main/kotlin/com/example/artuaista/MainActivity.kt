package com.example.artuaista

import com.example.artuaista.bridge.Bridges
import com.example.artuaista.bridge.feature.wallpaper.WallpaperBridge
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.artuaista/wallpaper"

    private val bridgeCalls: ArrayList<String>
    private val wallpaperBridge = WallpaperBridge()
    private val _mainCoroutineScope = CoroutineScope(Dispatchers.Main)

    init {
        val systemBridges = Bridges()

        bridgeCalls = systemBridges.getBridgeCalls()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {

        val mainChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

        /**
         * By default this code is configured to run on a secondary lightweight thread
         * to avoid UI freezes, if you need to make a synchronous call, remember to change the scope
         * */

        mainChannel.setMethodCallHandler { call, result ->
            val callMethod = call.method

            if (bridgeCalls.contains(callMethod)) {
                _mainCoroutineScope.launch {
                    val callResult = when (callMethod) {
                        // WALLPAPER BRIDGE
                        "WallpaperAndroidBridge@setWallpaper" -> {
                            withContext(Dispatchers.IO) {
                                val arguments = call.arguments as Map<*, *>
                                wallpaperBridge.setWallpaper(arguments, context)
                            }
                        }
                        // NULL BRIDGE
                        else -> null
                    }

                    result.success(callResult)
                }
            } else {
                result.notImplemented()
            }
        }

        super.configureFlutterEngine(flutterEngine)
    }
}
