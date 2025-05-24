import UIKit

class HomeView: UIView {
  // MARK: - UI Components
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  
  private let assistidosLabel: UILabel = {
    let label = UILabel()
    label.text = "Assistidos"
    label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    label.textColor = .white
    return label
  }()
  
  private let moreLabel: UILabel = {
    let label = UILabel()
    label.text = "mais tarde"
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    label.textColor = .lightGray
    return label
  }()
  
  let moviesCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 12
    layout.minimumLineSpacing = 16
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    collectionView.showsVerticalScrollIndicator = false
    collectionView.isScrollEnabled = false
    collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    return collectionView
  }()
  
  // MARK: - Initialization
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup
  private func setupView() {
    backgroundColor = UIColor(red: 0.12, green: 0.14, blue: 0.18, alpha: 1.0)
    setupHierarchy()
    setupConstraints()
  }
  
  private func setupHierarchy() {
    addSubview(scrollView)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    contentView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(contentView)
    
    [assistidosLabel, moreLabel, moviesCollectionView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      
      assistidosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      assistidosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      
      moreLabel.centerYAnchor.constraint(equalTo: assistidosLabel.centerYAnchor),
      moreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      
      moviesCollectionView.topAnchor.constraint(equalTo: assistidosLabel.bottomAnchor, constant: 16),
      moviesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      moviesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      moviesCollectionView.heightAnchor.constraint(equalToConstant: 400),
      moviesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
    ])
  }
}
