//
//  AppDelegate.swift
//  For_0416
//
//  Created by 민유 on 2020/08/07.
//  Copyright © 2020 민유. All rights reserved.
//
//  우리가 기억하는 한
//  그들은 절대 침몰하지 않습니다.

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
        
    // 메뉴 바 생성
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
    
    // 디데이 생성
    func MakeDday() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDate = dateFormatter.date(from: "2014-04-16")!
        let currentDate = Date()
        let dday = Calendar.current.dateComponents([.day], from: startDate, to: currentDate).day!
        return dday
    }
    
    // 메인
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
      if let button = statusItem.button {
        button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
        button.imagePosition = NSControl.ImagePosition.imageLeft
        let dday = MakeDday()
        button.title = "+\(dday)"
        
//        button.title = "For_0416"
        
        button.action = #selector(togglePopover(_:))
      }
        
      popover.contentViewController = PopoverView.freshController()
    }
    
    // 팝 오버
    let popover = NSPopover()
    
    @objc func togglePopover(_ sender: Any?) {
      if popover.isShown {
        closePopover(sender: sender)
      } else {
        showPopover(sender: sender)
      }
    }

    func showPopover(sender: Any?) {
      if let button = statusItem.button {
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
      }
    }

    func closePopover(sender: Any?) {
      popover.performClose(sender)
    }


}
