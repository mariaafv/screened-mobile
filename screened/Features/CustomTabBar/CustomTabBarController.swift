import UIKit

class CustomTabBarController: UITabBarController {
  
  private let middleButton = UIButton()
  private let customBackgroundView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewControllers()
    setupMiddleButton()
    setupCustomTabBarBackground()
    
    tabBar.tintColor = .appLightBlue
    tabBar.unselectedItemTintColor = .appLightGray
  }
  
  private func setupCustomTabBarBackground() {
    customBackgroundView.backgroundColor = .appBackground
    customBackgroundView.frame = tabBar.bounds
    customBackgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    tabBar.insertSubview(customBackgroundView, at: 0)
  }
  
  private func setupViewControllers() {
    let homeViewController = HomeViewController()
    homeViewController.tabBarItem = UITabBarItem(title: "Home",
                                     image: UIImage(systemName: "house"),
                                     selectedImage: UIImage(systemName: "house.fill"))
    
    let watchListVC = MovieInfoViewController()
    watchListVC.view.backgroundColor = .appBackground
    watchListVC.tabBarItem = UITabBarItem(title: "Watch List",
                                          image: UIImage(systemName: "bookmark"),
                                          selectedImage: UIImage(systemName: "bookmark.fill"))
    
    viewControllers = [homeViewController, UIViewController(), watchListVC] // slot do botão central vazio
  }
  
  private func setupMiddleButton() {
    middleButton.translatesAutoresizingMaskIntoConstraints = false
    middleButton.setImage(UIImage(systemName: "sparkle"), for: .normal)
    middleButton.tintColor = .appLightGray
    middleButton.backgroundColor = .appBackground
    middleButton.layer.cornerRadius = 35
    middleButton.layer.borderColor = UIColor(resource: .appLightBlue).cgColor
    middleButton.layer.borderWidth = 3
    
    view.addSubview(middleButton)
    
    NSLayoutConstraint.activate([
      middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
      middleButton.centerYAnchor.constraint(equalTo: tabBar.topAnchor),
      middleButton.widthAnchor.constraint(equalToConstant: 70),
      middleButton.heightAnchor.constraint(equalToConstant: 70)
    ])
  }
}
