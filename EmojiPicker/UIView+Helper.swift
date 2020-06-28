//
//  UIView+Helper.swift
//  EmojiPicker
//
//  Created by Abhishek Thapliyal on 28/06/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {

    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    weak var delegate: NSObjectProtocol? = nil
    
    func configure(_ item: Any?) {
        
    }
    
}

class CollectionReusableView: UICollectionReusableView {
    
    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    weak var delegate: NSObjectProtocol? = nil
    
    func configure(_ item: Any?) {
        
    }
    
}

public extension NSObject {
    
    class func className() -> String {
        let className = (NSStringFromClass(self) as String).components(separatedBy: ".").last! as String
        return className
    }
    
    func className() -> String {
        let className = (NSStringFromClass(self.classForCoder) as String).components(separatedBy: ".").last! as String
        return className
    }
    
}


public extension UICollectionReusableView {
    
    class var defaultReuseIdentifier: String {
        return self.className()
    }
    
    class var defaultNib: UINib {
        return UINib(nibName: self.className(), bundle: nil)
    }
    
}

class TableViewCell: UITableViewCell {

    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }

    weak var delegate: NSObjectProtocol? = nil

    func configure(_ item: Any?) {

    }

}


class TableHeaderFooterView: UITableViewHeaderFooterView {

    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }

    weak var delegate: NSObjectProtocol? = nil

    func configure(_ item: Any?) {

    }
    
}


extension UIView {
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return 1.0
        } set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.black
        } set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return 1.0
        } set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }

    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor.clear
        } set {
            self.layer.masksToBounds = false
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        } set {
            self.layer.shadowRadius = newValue
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        } set {
            self.layer.shadowOffset = newValue
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        } set {
            self.layer.shadowOpacity = newValue
            self.layer.masksToBounds = false
        }
    }
    
}
