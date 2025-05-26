import UIKit

class MovieInfoViewController: UIViewController {
  private lazy var moviesInfoView = MovieInfoView()

  override func loadView() {
    self.view = moviesInfoView
    
  }
}
