package com.example.artuaista.bridge

import android.app.WallpaperManager
import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory


class WallpaperBridge {
    fun setWallpaper(wallpaperBytes: ByteArray, context: Context): Boolean {
        val wallpaperManager = WallpaperManager.getInstance(context)

        return try {
            val wallpaperBitmap: Bitmap = BitmapFactory.decodeByteArray(wallpaperBytes, 0, wallpaperBytes.size)
            wallpaperManager.setBitmap(wallpaperBitmap)
            true
        } catch (e: Exception){
            false
        }
    }
}