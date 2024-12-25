//
//  MainViewCell.swift
//  MVVM
//
//  Created by Тимофей Олегович on 25.12.2024.
//

import UIKit
import SDWebImage

class MainViewCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MainViewCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainViewCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!

    
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.addBorder(color: .blue, width: 1)
        backView.round()
        
        
        movieImageView.round(5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
//        print("Image URL: \(String(describing: viewModel.imageUrl))")
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
}
