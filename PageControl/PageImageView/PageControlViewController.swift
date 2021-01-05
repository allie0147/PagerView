//
//  ViewController.swift
//  PageControl
//
//  Created by Allie Kim on 2021/01/04.
//

import UIKit

class PageControlViewController: UIViewController {
    // mainVC에서 PageControlViewController(nibName: PageControlViewController.identifier, bundle: nil)로 VC load
    static let identifier = "PageControlViewController"

    @IBOutlet weak var pageImageView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!

    var arrImageView = [UIViewController]() // imageView를 담을 VC array

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        setPagingView()
    }

    private func setPagingView() {
        arrImageView = [UIViewController]()
        // page(imageView) settings
        for i in 0..<10 {
          
            let viewController = UIViewController()
            let subView = PageImageView(frame: pageImageView.bounds)
            subView.settingLayout(index: i)
            viewController.view.frame = pageImageView.bounds
            viewController.view.addSubview(subView)
            arrImageView.append(viewController)
        }
        // pageControl settings
        pageControl.numberOfPages = arrImageView.count
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.view.frame = pageImageView.bounds
        pageImageView.addSubview(pageViewController.view)
        self.addChild(pageViewController)

        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([arrImageView[0]], direction: .forward, animated: true, completion: nil)
    }
}

//MARK: - Extension: UIPageViewControllerDataSource
extension PageControlViewController: UIPageViewControllerDataSource {

    // pageVC에서 현재 뷰의 이전 index: pop 스와이프시 실행
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index: NSInteger = arrImageView.firstIndex(of: viewController)!
        print("viewControllerBefore(): \(index)")
        index -= 1
        if index < 0 {
            return nil
        }
        return arrImageView[index]
    }

    // pageVC에서 현재 뷰의 이후 index: push 스와이프 시 실행
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index: NSInteger = arrImageView.firstIndex(of: viewController)!
        index += 1
        print("viewControllerAfter: \(index)")
        if index == arrImageView.count {
            return nil
        }
        return arrImageView[index]

    }
}
//MARK: - Extension: UIPageViewControllerDelegate
extension PageControlViewController: UIPageViewControllerDelegate {
    // pageVC에서 현재 뷰의 index
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let index: NSInteger = arrImageView.firstIndex(of: (pageViewController.viewControllers?.last)!)!
        pageControl.currentPage = index
        print("didFinishAnimating(): \(index)")
    }
}
