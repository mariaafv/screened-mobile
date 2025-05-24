import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Properties
  private let viewModel = HomeViewModel()
  private lazy var moviesView = HomeView()
  private var movies: [Movie] = []
  
  // MARK: - Lifecycle
  override func loadView() {
    view = moviesView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewController()
    bindViewModel()
    setupCollectionView()
  }
  
  // MARK: - Setup
  private func setupViewController() {
    title = "Filmes"
  }
  
  private func bindViewModel() {
    self.movies = viewModel.watchedMovies
    self.moviesView.moviesCollectionView.reloadData()
  }
  
  private func setupCollectionView() {
    moviesView.moviesCollectionView.delegate = self
    moviesView.moviesCollectionView.dataSource = self
  }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
    cell.configure(with: movies[indexPath.item])
    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let movie = movies[indexPath.item]
    print("Filme selecionado: \(movie.title)")

  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let totalSpacing: CGFloat = 12 * 2
    let availableWidth = collectionView.frame.width - totalSpacing
    let itemWidth = availableWidth / 3
    return CGSize(width: itemWidth, height: itemWidth * 1.5)
  }
}
