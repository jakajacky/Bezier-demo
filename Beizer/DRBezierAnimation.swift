//
//  DRBezierAnimation.swift
//  Beizer
//
//  Created by xqzh on 16/10/27.
//  Copyright © 2016年 xqzh. All rights reserved.
//

import UIKit

class DRBezierAnimation: UIView {
  
  var start = CGPoint(x: 0, y: 150)
  var end   = CGPoint(x: 200, y: 150)
  var con1 = CGPoint(x: 80, y: 100)
  var con2 = CGPoint(x: 140, y: 200)
  
  var path = UIBezierPath()
  
  var i=1
  var fla = 1.0
  let backgroundLayer = CAShapeLayer()
  var b = [Int]()
  var disp:CADisplayLink!
  
  override func draw(_ rect: CGRect) {

    let co = UIColor.cyan
    co.set()
    
    path.lineWidth = 5.0
    path.lineCapStyle = CGLineCap.round
    path.lineJoinStyle = CGLineJoin.round
    
    path.move(to: start)
    path.addCurve(to: end, controlPoint1: con1, controlPoint2: con2)
    
    
    backgroundLayer.path = path.cgPath;
    backgroundLayer.strokeColor = UIColor.lightGray.cgColor
    backgroundLayer.fillColor = UIColor.red.cgColor
    backgroundLayer.lineWidth = 5.0
  
    self.layer.addSublayer(backgroundLayer)
    
    con1 = CGPoint(x: con1.x, y: 0+3)
    con2 = CGPoint(x: con2.x, y: 300+3)
    path.move(to: CGPoint(x: start.x, y: 150+3))
    path.addCurve(to: CGPoint(x: end.x, y: 150+3), controlPoint1: con1, controlPoint2: con2)
    path.addLine(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x:200, y: 0))
    backgroundLayer.path = path.cgPath

    
    path.close()
    disp = CADisplayLink(target: self, selector: #selector(timer))
    disp.add(to: RunLoop.main, forMode: .commonModes)
    
    for index in 1...20 {
      
      b.append(index)
    }
    var a = b
    a.remove(at: 19)
    for index in a.reversed() {
      b.append(index)
    }
    
    print(b)
  }
  
  func timer() {
    i += 1

    con1 = CGPoint(x: CGFloat(80+b[i%39]), y: con1.y)
    con2 = CGPoint(x: CGFloat(140+b[i%39]), y: con2.y)
    path.removeAllPoints()
    path.move(to: CGPoint(x: CGFloat(-20+b[i%39]), y: start.y))
    path.addCurve(to: CGPoint(x: CGFloat(395+b[i%39]), y: end.y), controlPoint1: con1, controlPoint2: con2)
    path.addLine(to: CGPoint(x:CGFloat(395+b[i%39]), y: 400))
    path.addLine(to: CGPoint(x: CGFloat(-20+b[i%39]), y: 400))
    
    backgroundLayer.path = path.cgPath
    
    
    
    path.close()
  }
  
}
