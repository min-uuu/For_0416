//
//  PopoverView.swift
//  For_0416
//
//  Created by 민유 on 2020/08/07.
//  Copyright © 2020 민유. All rights reserved.
//

import Cocoa

class PopoverView: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension PopoverView {
  // MARK: Storyboard instantiation
  static func freshController() -> PopoverView {
    //1.
    let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
    //2.
    let identifier = NSStoryboard.SceneIdentifier("PopoverView")
    //3.
    guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? PopoverView else {
      fatalError("Something Wrong")
    }
    return viewcontroller
  }
}
