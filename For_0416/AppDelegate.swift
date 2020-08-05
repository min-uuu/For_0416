//
//  AppDelegate.swift
//  For_0416
//
//  Created by 민유 on 2020/08/05.
//  Copyright © 2020 민유. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        
        // Create the window and set the content view.
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        
        if let button = statusItem.button {
          button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
          button.action = #selector(printQuote(_:))
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    

    @objc func printQuote(_ sender: Any?) {
      let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
      let quoteAuthor = "Mark Twain"
      
      print("\(quoteText) — \(quoteAuthor)")
    }

}
