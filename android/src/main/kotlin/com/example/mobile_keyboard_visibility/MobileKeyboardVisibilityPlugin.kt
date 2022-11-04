package com.example.mobile_keyboard_visibility

import android.R
import android.app.Activity
import android.graphics.Rect
import android.view.View
import android.view.ViewGroup
import android.view.ViewTreeObserver
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** MobileKeyboardVisibilityPlugin */
class MobileKeyboardVisibilityPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, EventChannel.StreamHandler, ViewTreeObserver.OnGlobalLayoutListener {

  private lateinit var channel : MethodChannel
  private lateinit var eventChannel: EventChannel
  private  var mainView: View? = null
  private  var eventSink: EventChannel.EventSink? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "mobile_keyboard_visibility_dispose")
    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "mobile_keyboard_visibility_listener")
    channel.setMethodCallHandler(this)
    eventChannel.setStreamHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method.equals("dispose")) {
      dispose()
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    listenForKeyboard(binding.activity)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    dispose()
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    listenForKeyboard(binding.activity)
  }

  override fun onDetachedFromActivity() {
    dispose()
  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    eventSink = events
  }

  override fun onCancel(arguments: Any?) {
    eventSink = null
  }

  private fun listenForKeyboard(activity: Activity) {
    mainView = activity.findViewById<ViewGroup>(R.id.content)
    mainView!!.viewTreeObserver.addOnGlobalLayoutListener(this)
  }

  private fun unregisterListener() {
    if (mainView != null) {
      mainView!!.viewTreeObserver.removeOnGlobalLayoutListener(this);
      mainView = null
    }
  }

  private fun dispose() {
    unregisterListener()
  }

  override fun onGlobalLayout() {
    if(mainView != null) {
      val r = Rect()
      mainView!!.getWindowVisibleDisplayFrame(r)
      var newState = r.height().toDouble() / mainView!!.rootView.height.toDouble() < 0.85
      eventSink?.success(mapOf("height" to mainView!!.rootView.height.toDouble()))
    }
  }
}
