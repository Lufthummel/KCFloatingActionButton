//
//  KCFABManager.swift
//  KCFloatingActionButton-Sample
//
//  Created by LeeSunhyoup on 2015. 10. 13..
//  Copyright © 2015년 kciter. All rights reserved.
//

import UIKit

/**
    KCFloatingActionButton dependent on UIWindow.
*/
public class KCFABManager: NSObject {
    private static var __once: () = {
            StaticInstance.instance = KCFABManager()
        }()
    struct StaticInstance {
        static var dispatchToken: Int = 0
        static var instance: KCFABManager?
    }
    
    public class func defaultInstance() -> KCFABManager {
        _ = KCFABManager.__once
        return StaticInstance.instance!
    }
    
    var _fabWindow: KCFABWindow? = nil
    var fabWindow: KCFABWindow {
        get {
            if _fabWindow == nil {
                _fabWindow = KCFABWindow(frame: UIScreen.main().bounds)
                _fabWindow?.rootViewController = fabController
            }
            return _fabWindow!
        }
    }
    
    var _fabController: KCFABViewController? = nil
    var fabController: KCFABViewController {
        get {
            if _fabController == nil {
                _fabController = KCFABViewController()
            }
            return _fabController!
        }
    }
    
    public func getButton() -> KCFloatingActionButton {
        return fabController.fab
    }
    
    public func show(animated: Bool = true) {
        if animated == true {
            fabWindow.isHidden = false
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.fabWindow.alpha = 1
            })
        } else {
            fabWindow.isHidden = false
        }
    }
    
    public func hide(animated: Bool = true) {
        if animated == true {
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.fabWindow.alpha = 0
                }, completion: { finished in
                    self.fabWindow.isHidden = true
            })
        } else {
            fabWindow.isHidden = true
        }
    }
    
    public func toggle(animated: Bool = true) {
        if fabWindow.isHidden == false {
            self.hide(animated: animated)
        } else {
            self.show(animated: animated)
        }
    }
    
    public func isHidden() -> Bool {
        return fabWindow.isHidden
    }
}
