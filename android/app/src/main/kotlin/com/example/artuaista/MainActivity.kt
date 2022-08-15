package com.example.artuaista

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.artuaista/wallpaper"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getHelloWorld") {
                val helloWorld = getHelloWorld()

                result.success(helloWorld)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getHelloWorld(): String {
        Log.d("HELLO FLUTTER", "LOG FROM NATIVE")

        return "Hello world from Android native code!"
    }
}
