import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
  static let identifier = "MovieCollectionViewCell"
  
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 8
    imageView.backgroundColor = .darkGray
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupCell() {
    contentView.addSubview(imageView)
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  func configure(with movie: Movie) {
    // Aqui você carregaria a imagem real
    // Por enquanto, vamos usar cores diferentes para simular
    let colors: [UIColor] = [.systemRed, .systemBlue, .systemGreen, .systemOrange, .systemPurple, .systemPink]
    if let id = Int(movie.id) {
      imageView.backgroundColor = colors[id % colors.count]
    } else {
      imageView.backgroundColor = .gray // cor padrão se id for inválido
    }
    
    // Para usar imagens reais, descomente a linha abaixo:
    // imageView.image = UIImage(named: movie.imageName)
  }
}
