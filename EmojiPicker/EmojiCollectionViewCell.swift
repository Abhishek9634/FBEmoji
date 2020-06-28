//
//  EmojiCollectionViewCell.swift
//  EmojiPicker
//
//  Created by Abhishek Thapliyal on 28/06/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

protocol EmojiCollectionCellDelegate: class {
    func didTapEmoji(_ cell: EmojiCollectionViewCell)
}

class EmojiCollectionViewCell: CollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func configure(_ item: Any?) {
        guard let model = item as? EmojiReaction else { return }
        self.imgView.image = model.image
    }
    
    @IBAction func tapAction(_ sender: UIButton) {
        (self.delegate as? EmojiCollectionCellDelegate)?.didTapEmoji(self)
    }
    
}
