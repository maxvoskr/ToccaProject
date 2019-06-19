//
//  CurvedImageView.swift
//  ToccaProject
//
//  Created by Maksym Voskresenskyy on 6/18/19.
//  Copyright © 2019 Maksym Voskresenskyy. All rights reserved.
//

import UIKit

class CurvedContainerView: UIView {
    override func draw(_ rect: CGRect) {
        do {
            let path = UIBezierPath() //Create the path
            path.move(to: CGPoint(x: 0.0, y: 0.0)) //Give it a starting point
            path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height - 20)) //Get ready to get curvy
            path.addQuadCurve(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height - 20), controlPoint: CGPoint(x: rect.width/2, y: rect.height + 20)) // Hit the curve
            path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0)) // back to start
            path.close() //close
            
            let shapeLayer = CAShapeLayer() //make shape to overlay easier
            shapeLayer.path = path.cgPath
            
            self.layer.mask = shapeLayer
        }
    }
    
}
