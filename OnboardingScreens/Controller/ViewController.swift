//
//  ViewController.swift
//  OnboardingScreens
//
//  Created by Janarthanan Kannan on 09/04/24.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    ///Properties
    private var onboardingSlides: [OnboardingModel] = []
    private var currentPage = 0 {
        didSet {
            updateCurrentPage()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - SetupUI
    private func setupUI() {
        onboardingSlides = [
            OnboardingModel(title: "No ads while listening music",
                            description: "Listening to music is very comfortable without annoying any ads",
                            image: UIImage(named: "slide1")!),
            OnboardingModel(title: "Listen to music offline",
                            description: "Download the music you want and enjoy it whenever and whatever",
                            image: UIImage(named: "slide2")!),
            OnboardingModel(title: "Share your playlist",
                            description: "Share the playlist you created and share it with friends and family",
                            image: UIImage(named: "slide3")!)
        ]
        
        //PageControl
        pageControl.numberOfPages = onboardingSlides.count
    }
    
    private func updateCurrentPage() {
        pageControl.currentPage = currentPage
        
        nextButton.setTitle(
            currentPage == onboardingSlides.count - 1 ? "Get Started" : "Next" ,
            for: .normal)
    }
    
    //MARK: - UIButton Action
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentPage == onboardingSlides.count - 1 ? print("Get Started") : moveToNext()
    }
    
    private func moveToNext() {
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, 
                                  section: 0)
        collectionView.scrollToItem(at: indexPath, 
                                    at: .centeredHorizontally,
                                    animated: true)
    }

}

//MARK: - UICollectionView DataSource
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionCell.identifier,
                                                      for: indexPath) as! OnboardingCollectionCell
        cell.setupCell(onboardingSlides[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionView Delegates
extension ViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

//MARK: - UICollectionView Delegate FlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
    }
}

