//
//  EmojiReactionsPicker.swift
//  EmojiPicker
//
//  Created by Abhishek Thapliyal on 28/06/20.
//  Copyright © 2020 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import UIKit

protocol EmojiReactionsPickerDelegate: class {
    func didSelectEmoji(_ piker: EmojiReactionsPicker,
                        emoji: EmojiReaction)
}


class EmojiReactionsPicker: UIView {
    
    weak var delegate: EmojiReactionsPickerDelegate?
    private var emojis = [EmojiReaction]()
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        return UICollectionView(
            frame: self.bounds,
            collectionViewLayout: flowLayout
        )
    }()
    
    init(source: UIView, emojis: [EmojiReaction]) {
        super.init(frame: .zero)
        self.emojis = emojis
        self.setupColletionView()
        self.setupView(source: source)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView.frame = self.bounds
    }
    
}

extension EmojiReactionsPicker {
    
    private func setupView(source: UIView) {
        let emojiScale: CGFloat = 25
        
        let padding = CGFloat((self.emojis.count + 1) * 5)
        let width = (CGFloat(self.emojis.count) * emojiScale) + padding
        let height = emojiScale + 10
        
        let x = source.frame.origin.x
        let y = source.frame.origin.y - (height + 10)
        self.frame = CGRect(x: x,
                            y: y,
                            width: width,
                            height: height)
        self.backgroundColor = .white
        self.borderWidth = 1
        self.borderColor = UIColor(white: 0.5, alpha: 0.1)
        self.layer.cornerRadius = height / 2
        self.layer.masksToBounds = true
        self.addSubview(self.collectionView)
    }
    
    func show(parentView: UIView) {
        self.alpha = 0
        parentView.addSubview(self)
        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.5,
                       options: [.curveEaseIn],
                       animations: {
            self.alpha = 1
        })
    }
    
    func hide() {
        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.5,
                       options: [.curveEaseOut] ,
                       animations: {
            self.alpha = 0
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
    
}

extension EmojiReactionsPicker: UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    
    private func setupColletionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(
            EmojiCollectionViewCell.defaultNib,
            forCellWithReuseIdentifier: EmojiCollectionViewCell.defaultReuseIdentifier
        )
        self.collectionView.backgroundColor = .clear
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.emojis.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: EmojiCollectionViewCell.defaultReuseIdentifier,
            for: indexPath
        ) as! EmojiCollectionViewCell
        cell.item = self.emojis[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let factor = CGFloat((self.emojis.count + 1) * 5)
        let scale = (collectionView.bounds.width - factor) / CGFloat(self.emojis.count)
        return CGSize(width: scale, height: scale)
    }
    
}

extension EmojiReactionsPicker: EmojiCollectionCellDelegate {
    
    func didTapEmoji(_ cell: EmojiCollectionViewCell) {
        guard let emoji = cell.item as? EmojiReaction else { return }
        self.delegate?.didSelectEmoji(self, emoji: emoji)
    }
    
}
