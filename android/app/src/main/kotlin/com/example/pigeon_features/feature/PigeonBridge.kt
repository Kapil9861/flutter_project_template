package com.example.pigeon_features.feature

import io.flutter.plugin.common.BinaryMessenger
import com.example.pigeon_features.feature.FromFlutter
import android.util.Log

object PigeonBridge {
    private var api: FromFlutter? = null

    // Call this once in MainActivity
    fun initialize(messenger: BinaryMessenger) {
        api = FromFlutter(messenger)
    }

    /**
     * This is your "Global function" you can call from anywhere.
     */
    fun sendConnectionStatus(isConnected: Boolean) {
        val apiInstance = api ?: run {
            Log.e("PigeonBridge", "API not initialized! Call initialize() first.")
            return
        }

        apiInstance.isConnected(isConnected) { result ->
            result.onSuccess {
                Log.d("PigeonBridge", "Successfully notified Flutter: $isConnected")
            }
            result.onFailure { error->
                Log.e("PigeonBridge", "Failed to notify Flutter: ${error.message}")
            }
        }
    }
}
