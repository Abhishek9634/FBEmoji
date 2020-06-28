//
//  ViewController.swift
//  EmojiPicker
//
//  Created by Abhishek Thapliyal on 24/06/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emojiButton: UIButton!

    var emojiView: EmojiReactionsPicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func emojiPickerAction(_ sender: UIButton) {
        self.showEmojiReactions(source: sender)
    }
    
}

extension ViewController: EmojiReactionsPickerDelegate {
    
    func didSelectEmoji(_ piker: EmojiReactionsPicker, emoji: EmojiReaction) {
        print(emoji)
        piker.hide()
        self.emojiView = nil
    }
        
    func showEmojiReactions(source: UIView) {
        
        if let _ = self.emojiView {
            self.emojiView!.hide()
            self.emojiView = nil
        } else {
            let emojis = [
                EmojiReaction(imageName: "like", emojiCode: "like"),
                EmojiReaction(imageName: "love", emojiCode: "love"),
                EmojiReaction(imageName: "care", emojiCode: "care"),
                EmojiReaction(imageName: "haha", emojiCode: "haha"),
                EmojiReaction(imageName: "wow", emojiCode: "wow"),
                EmojiReaction(imageName: "sad", emojiCode: "sad"),
                EmojiReaction(imageName: "angry", emojiCode: "angry")
            ]
            self.emojiView = EmojiReactionsPicker(source: source,
                                                  emojis: emojis)
            self.emojiView?.delegate = self
            self.emojiView!.show(parentView: self.view)
        }
    }
    
}
