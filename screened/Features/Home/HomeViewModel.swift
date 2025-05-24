import Foundation

class HomeViewModel: ObservableObject {
    @Published var watchedMovies: [Movie] = []
    
    init() {
        loadWatchedMovies()
    }
    
    private func loadWatchedMovies() {
        // Simulando os filmes da tela
        watchedMovies = [
            Movie(id: "1", title: "Homem de Ferro", imageName: "iron_man"),
            Movie(id: "2", title: "Vingadores", imageName: "avengers"),
            Movie(id: "3", title: "Batman", imageName: "batman"),
            Movie(id: "4", title: "Sonic", imageName: "sonic"),
            Movie(id: "5", title: "Homem Formiga", imageName: "ant_man"),
            Movie(id: "6", title: "Vingadores Ultimato", imageName: "avengers_endgame")
        ]
    }
}
