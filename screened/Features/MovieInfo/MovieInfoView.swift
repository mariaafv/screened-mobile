import UIKit

class MovieInfoView: UIView {
  
  let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = 16
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  let indicationText: UILabel = {
    let label = UILabel()
    label.text = "You may like"
    label.textColor = .white
    label.textAlignment = .center
    label.font = UIFont(name: "Poppins-SemiBold", size: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let imageView: UIImageView = {
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
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView() {
    addSubview(scrollView)
    scrollView.addSubview(stackView)
    stackView.addArrangedSubview(indicationText)
    stackView.addArrangedSubview(imageView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      // Constraints para scrollView
      scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      // Constraints para stackView
      stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60),
      stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      
      // Constraints para imageView
      imageView.widthAnchor.constraint(equalToConstant: 200),
      imageView.heightAnchor.constraint(equalToConstant: 300)
    ])
  }
}
