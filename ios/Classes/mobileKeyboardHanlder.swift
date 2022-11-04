//
//  mobileKeyboardHanlder.swift
//  mobile_keyboard_visibility
//
//  Created by 邹琳 on 2022/11/4.
//

import Foundation


class MobileKeyboardHandler: NSObject, FlutterStreamHandler {
  
  var eventSink: FlutterEventSink?
  
  override init() {
    super.init()
    addListener()
  }
  
  func addListener() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIApplication.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIApplication.keyboardWillHideNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIApplication.keyboardDidHideNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIApplication.keyboardDidShowNotification, object: nil)
  }
  
  @objc func keyboardWillShow(ano: Notification) {
    guard let rect:NSValue = ano.userInfo![UIApplication.keyboardFrameEndUserInfoKey] as? NSValue else { return }
    let height = rect.cgRectValue.size.height
    self.eventSink?(["height": height])
    self.eventSink?(["status": 2])
  }
  
  @objc func keyboardWillHide(ano: Notification) {
    self.eventSink?(["status": 0])
  }
  
  @objc func keyboardDidHide(ano: Notification) {
    self.eventSink?(["status": 1])
  }
  
  @objc func keyboardDidShow(ano: Notification) {
    self.eventSink?(["status": 3])
  }
  
  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    eventSink = events;
    return nil;
  }
  
  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    eventSink = nil;
    return nil;
  }
  
  func dispose() {
    NotificationCenter.default.removeObserver(self)
    self.eventSink?(FlutterEndOfEventStream)
  }
}
