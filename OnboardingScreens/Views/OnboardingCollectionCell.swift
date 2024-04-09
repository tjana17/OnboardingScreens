//
//  OnboardingCollectionCell.swift
//  OnboardingScreens
//
//  Created by Janarthanan Kannan on 09/04/24.
//

import UIKit

class OnboardingCollectionCell: UICollectionViewCell {
    
    //MARK: - Constants
    
    ///Reuse cell identifier
    static let identifier = "onboardingCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /// Method to configure cell
    func setupCell(_ item: OnboardingModel) {
        imageView.image = item.image
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
}
