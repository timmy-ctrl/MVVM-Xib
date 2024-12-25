//
//  DetailsMovieViewController.swift
//  MVVM
//
//  Created by Тимофей Олегович on 25.12.2024.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()

    }
    
    func configView() {
        self.title = "Movie Details"
        self.titleLabel.text = viewModel.movieTitle
        self.yearLabel.text = viewModel.movieYear
        self.movieImageView.sd_setImage(with: viewModel.movieImage)
    }
}
