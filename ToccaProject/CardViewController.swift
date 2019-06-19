//
//  CardViewController.swift
//  ToccaProject
//
//  Created by Maksym Voskresenskyy on 6/18/19.
//  Copyright © 2019 Maksym Voskresenskyy. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    var tabBarItemOne: UITabBarItem = UITabBarItem()
    var tabBarItemTwo: UITabBarItem = UITabBarItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardView.clipsToBounds = true
        self.cardView.layer.cornerRadius = self.cardView.layer.frame.width / 10
        
        let qrCodeimage = generateQRCode(from: "Generate QR code")
        self.qrCodeImageView.image = qrCodeimage
        
        self.addButton.clipsToBounds = true
        self.addButton.layer.cornerRadius = self.addButton.layer.frame.width / 2
        self.view.bringSubviewToFront(addButton)
        
        self.addButton.layer.masksToBounds = false
        self.addButton.layer.shadowOffset = CGSize.zero
        self.addButton.layer.shadowRadius = 5
        self.addButton.layer.shadowOpacity = 0.5
        
        self.shareButton.clipsToBounds = true
        self.shareButton.layer.cornerRadius = self.shareButton.layer.frame.width / 2
        self.view.bringSubviewToFront(shareButton)
        
        self.shareButton.layer.masksToBounds = false
        self.shareButton.layer.shadowOffset = CGSize.zero
        self.shareButton.layer.shadowRadius = 5
        self.shareButton.layer.shadowOpacity = 0.5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabBarControllerItems = self.tabBarController?.tabBar.items
        
        if let tabArray = tabBarControllerItems {
            tabBarItemOne = tabArray[0]
            tabBarItemTwo = tabArray[2]
            
            tabBarItemOne.isEnabled = false
            tabBarItemTwo.isEnabled = false
        }
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
}
