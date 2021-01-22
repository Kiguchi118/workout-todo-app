//
//  MyUINavigationBarController.swift
//  MyToDoApp
//
//  Created by KY on 2021/01/20.
//

import UIKit

class MyUINavigationBarController: UINavigationBar {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.delegate = self
    }
    func position(for bar: UIBarPositioning) -> UIBarPosition {
       return .topAttached
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
