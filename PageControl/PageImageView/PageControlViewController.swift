//
//  ViewController.swift
//  PageControl
//
//  Created by ishift on 2021/01/04.
//

import UIKit

class PageControlViewController: UIViewController {

    @IBOutlet weak var pageImageView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!

    var arrImageView = [UIViewController]()
    var isFirst = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        if !isFirst {
            setPagingView()
        }
    }

    private func setPagingView() {
        isFirst = true
        arrImageView = [UIViewController]()

        for i in 0..<10 {
            let viewController = UIViewController()
            let view = PageImageView(frame: pageImageView.bounds)
            view.settingLayout(index: i)
            viewController.view.frame = pageImageView.bounds
            viewController.view.addSubview(view)
            arrImageView.append(viewController)
        }
        pageControl.numberOfPages = arrImageView.count
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.view.frame = pageImageView.bounds
        pageImageView.addSubview(pageViewController.view)
        self.addChild(pageViewController)

        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([arrImageView[0]], direction: .forward, animated: false, completion: nil)
    }
}

//MARK: - Extension: UIPageViewControllerDataSource
extension PageControlViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index: NSInteger = arrImageView.firstIndex(of: viewController)!
        index -= 1
        if index < 0 {
            return nil
        }
        return arrImageView[index]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index: NSInteger = arrImageView.firstIndex(of: viewController)!
        index += 1
        if index == arrImageView.count {
            return nil
        }
        return arrImageView[index]
    }
}
//MARK: - Extension: UIPageViewControllerDelegate
extension PageControlViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let index: NSInteger=arrImageView.firstIndex(of: (pageViewController.viewControllers?.last)!)!
        pageControl.currentPage = index
    }
}
