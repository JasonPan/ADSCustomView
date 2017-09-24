//
//  ADSCustomView.swift
//  UI Utilities
//
//  Created by Jason Pan on 11/03/2016.
//  Copyright © 2017 ANT Development Studios. All rights reserved.
//

import UIKit

// See: https://stackoverflow.com/a/31801454/699963
private extension NSObject {
    
    private class var nameOfClass: String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
    
    private var nameOfClass: String {
        return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
    }
    
}

@IBDesignable
public class ADSCustomView: UIView {
    
    //*********************************************************************************************************
    // MARK: - Interface Builder objects
    //*********************************************************************************************************
    
    @IBOutlet private weak var contentView: UIView!
    
    public override func prepareForInterfaceBuilder() {
        self.initialize()
    }
    
    //*********************************************************************************************************
    // MARK: - Constructors
    //*********************************************************************************************************
    
    public func initialize() {
        // Load nib file.
        NSBundle(forClass: self.dynamicType).loadNibNamed(self.nameOfClass, owner: self, options: nil)
        
        // Set up content view.
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.contentView)
        
        // Bind the edges of view and content view.
        self.addConstraint(NSLayoutConstraint(
            item        : self,
            attribute   : NSLayoutAttribute.Left,
            relatedBy   : NSLayoutRelation.Equal,
            toItem      : self.contentView,
            attribute   : NSLayoutAttribute.Left,
            multiplier  : 1,
            constant    : 0))
        
        self.addConstraint(NSLayoutConstraint(
            item        : self,
            attribute   : NSLayoutAttribute.Right,
            relatedBy   : NSLayoutRelation.Equal,
            toItem      : self.contentView,
            attribute   : NSLayoutAttribute.Right,
            multiplier  : 1,
            constant    : 0))
        
        self.addConstraint(NSLayoutConstraint(
            item        : self,
            attribute   : NSLayoutAttribute.Top,
            relatedBy   : NSLayoutRelation.Equal,
            toItem      : self.contentView,
            attribute   : NSLayoutAttribute.Top,
            multiplier  : 1,
            constant    : 0))
        
        self.addConstraint(NSLayoutConstraint(
            item        : self,
            attribute   : NSLayoutAttribute.Bottom,
            relatedBy   : NSLayoutRelation.Equal,
            toItem      : self.contentView,
            attribute   : NSLayoutAttribute.Bottom,
            multiplier  : 1,
            constant    : 0))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }

}
