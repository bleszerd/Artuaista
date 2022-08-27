package com.example.artuaista.bridge

class Bridges {
    private val wallpaperCals get() = arrayListOf("WallpaperAndroidBridge@setWallpaper")

    fun getBridgeCalls(): ArrayList<String>{
        val callList = ArrayList<String>()

        callList.addAll(wallpaperCals)

        return callList
    }
}