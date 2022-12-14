package com.example.artuaista.bridge.feature.wallpaper

import android.app.WallpaperManager
import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Rect


class WallpaperBridge {
    companion object {
        const val SET_WALLPAPER_IDENTIFIER: String ="WallpaperAndroidBridge@set"
    }

    fun setWallpaper(arguments: Map<*, *>, context: Context): Boolean {
        val wallpaperManager = WallpaperManager.getInstance(context)

        return try {
            val wallpaperBytesArg = arguments["wallpaperBytes"] as ByteArray;
            val wallpaperFlagArg = arguments["wallpaperFlag"] as String;

            val wallpaperBitmap: Bitmap = BitmapFactory.decodeByteArray(wallpaperBytesArg, 0, wallpaperBytesArg.size)
            val wallpaperFlag = getWallpaperFlag(wallpaperFlagArg)

            if (wallpaperFlag != null) {
                wallpaperManager.setBitmap(wallpaperBitmap, Rect(0, 0, wallpaperBitmap.width, wallpaperBitmap.height), true, wallpaperFlag)
            } else {
                wallpaperManager.setBitmap(wallpaperBitmap)
            }
            true
        } catch (e: Exception){
            false
        }
    }

    private fun getWallpaperFlag(flagStr: String): Int? {
        return when(flagStr){
            "system" -> WallpaperManager.FLAG_SYSTEM
            "lock" -> WallpaperManager.FLAG_LOCK
            else -> null
        }
    }
}