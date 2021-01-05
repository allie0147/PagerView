//
//  PageImageView.swift
//  PageControl
//
//  Created by Allie im on 2021/01/04.
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

    // add xib file to subView
    private func commonInit() {
        let view = Bundle.main.loadNibNamed(String(describing: PageImageView.self), owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }

    // image setting: 가장 먼저 실행
    public func settingLayout(index: Int) {
        pageImageView.image = UIImage(named: "image_0\(index)")
    }
}
