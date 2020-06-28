//
//  EmojiReaction.swift
//  EmojiPicker
//
//  Created by Abhishek Thapliyal on 28/06/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import UIKit

struct EmojiReaction {
    var imageName: String
    var emojiCode: String
    var image: UIImage {
        return UIImage(named: self.imageName)!
    }
}
