package com.example.artuaista.bridge.feature.wallpaper

import android.app.WallpaperManager
import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory


class WallpaperBridge {
    fun setWallpaper(arguments: Map<*, *>, context: Context): Boolean {
        val wallpaperManager = WallpaperManager.getInstance(context)

        return try {
            val wallpaperBytesArg = arguments["wallpaperBytes"] as ByteArray;
            val wallpaperFlagArg = arguments["wallpaperFlag"] as String;

            val wallpaperBitmap: Bitmap = BitmapFactory.decodeByteArray(wallpaperBytesArg, 0, wallpaperBytesArg.size)
            val wallpaperFlag = getWallpaperFlag(wallpaperFlagArg)

            if (wallpaperFlag != null) {
                wallpaperManager.setBitmap(wallpaperBitmap, null, true, wallpaperFlag)
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
            "SYSTEM" -> WallpaperManager.FLAG_SYSTEM
            "LOCK" -> WallpaperManager.FLAG_LOCK
            else -> null
        }
    }
}