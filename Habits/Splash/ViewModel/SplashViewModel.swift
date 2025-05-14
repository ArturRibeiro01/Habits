import SwiftUI

class SplashViewModel : ObservableObject {
    @Published var uiState : SplashUIState = .loading
    
    func onAppear() {
        //cria algo assíncrono
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            //delay de 2 segundos
//            self.uiState = .error("Erro no servidor")
            self.uiState = .goToSignInScreen
        }
    }
}

extension SplashViewModel {
    func SignInView() -> some View {
        return SplashViewRouter.makeSignInview()
    }
}
