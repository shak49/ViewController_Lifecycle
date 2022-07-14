//
//  CaptionImageView.swift
//  ViewController_Lifecycle
//
//  Created by Shak Feizi on 7/14/22.
//

import UIKit

class CaptionImageView: UIView {
    //MARK: - UI Elements
    private var contentView: UIView!
    private var label: UILabel!
    private var imageView: UIImageView!
    
    //MARK: - Properties
    var caption: String? {
        get { return label.text }
        set { label.text = newValue }
    }
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    //MARK: - Lifecycles
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //MARK: - Functions
    private func setupSubView() {
        let nib = UINib(nibName: "CaptionableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
