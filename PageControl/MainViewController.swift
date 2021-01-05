//
//  MainViewController.swift
//  PageControl
//
//  Created by Allie Kim on 2021/01/05.
//

import UIKit

class MainViewController: UIViewController {

    let vc = PageControlViewController(nibName: PageControlViewController.identifier, bundle: nil)

    override func viewDidLoad() {
        vc.modalPresentationStyle = .fullScreen
    }

    override func viewDidAppear(_ animated: Bool) {
        self.present(vc, animated: false, completion: nil)
    }
}
