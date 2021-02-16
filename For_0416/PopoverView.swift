//
//  PopoverView.swift
//  For_0416
//
//  Created by 민유 on 2020/08/07.
//  Copyright © 2020 민유. All rights reserved.
//

// 팝 오버의 액션을 담당하는 파일입니다.
// 스토리보드에서 맞는 보드를 가져와서 보여주는 역할을 해요.

import Cocoa

// 제가 코코아는 잘 몰라서 ㅠㅠㅠ
// 하여튼 이 함수는 팝 오버가 실행되고 나서 작동하는 함수 같아요.
// 여기서는 크게 만질 게 없을 거 같습니다.
class PopoverView: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension PopoverView {
  // MARK: Storyboard instantiation
  static func freshController() -> PopoverView {
    //1. 'Main'이라는 이름의 스토리보드를 불러옵니다.
    let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
    
    //2. Main 스토리보드 중에서 Popoverview를 불러와요.
    let identifier = NSStoryboard.SceneIdentifier("PopoverView")
    
    //3. 에러가 난 경우에 메시지를 반환해요.
    guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? PopoverView else {
      fatalError("Something Wrong")
    }
    return viewcontroller
  }
}
