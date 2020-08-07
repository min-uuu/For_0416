//
//  AppDelegate.swift
//  For_0416
//
//  Created by 민유 on 2020/08/07.
//  Copyright © 2020 민유. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    // 메뉴 바 생성
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    
    @objc func printQuote(_ sender: Any?) {
      let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
      let quoteAuthor = "Mark Twain"
      
      print("\(quoteText) — \(quoteAuthor)")
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
      if let button = statusItem.button {
        button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
        button.action = #selector(togglePopover(_:))
      }
      popover.contentViewController = QuotesViewController.freshController()
    }
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    // 리본 메뉴
    func constructMenu() {
      let menu = NSMenu()

      menu.addItem(NSMenuItem(title: "Print Quote", action: #selector(AppDelegate.printQuote(_:)), keyEquivalent: "P"))
      menu.addItem(NSMenuItem.separator())
      menu.addItem(NSMenuItem(title: "Quit Quotes", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

      statusItem.menu = menu
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
