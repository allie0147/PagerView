//
//  PageImageView.swift
//  PageControl
//
//  Created by ishift on 2021/01/04.
//

import UIKit

class PageImageView: UIView {

    @IBOutlet weak var pageImageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        let view = Bundle.main.loadNibNamed(String(describing: PageImageView.self), owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }

    public func settingLayout(index: Int) {
        guard index == 10 else {
            pageImageView.image = UIImage(named: "image_0\(index)")
        }
        pageImageView.image = UIImage(named: "image_10")
    }
}
