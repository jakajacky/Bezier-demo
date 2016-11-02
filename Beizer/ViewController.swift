//
//  ViewController.swift
//  Beizer
//
//  Created by xqzh on 16/10/27.
//  Copyright © 2016年 xqzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    let v = DRBezierAnimation(frame: CGRect(x: 0, y: 0, width: 200, height: 250))
    
    v.backgroundColor = UIColor.white
    self.view.backgroundColor = UIColor.black
    self.view.addSubview(v)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

