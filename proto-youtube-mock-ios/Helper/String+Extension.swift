//
//  String+Extension.swift
//  proto-youtube-mock-ios
//
//  Created by Santosh Krishnamurthy on 4/21/23.
//

import UIKit

extension String{
    func calculateLayoutHeightFor(width: CGFloat, attributes: [NSAttributedString.Key : Any]? = nil) -> CGFloat{
        
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return rect.height
    }
    
    func calculateLayoutWidthFor(height: CGFloat, attributes: [NSAttributedString.Key : Any]? = nil) -> CGFloat{
        
        let rect = NSString(string: self).boundingRect(with: CGSize(width: height, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return rect.width
    }
    
}
