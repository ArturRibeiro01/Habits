import Foundation
import SwiftUI


class SignInViewModel: ObservableObject {
    @Published var uiState: SignInUIState = .none
    
    func signIn(email: String, password: String) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.uiState = .error("Erro Meu filho")
//            self.uiState = .goToHomeScreen
        }
    }
}

extension SignInViewModel{
    func homeView() -> some View {
        return SignInViewRouter.makeSignInview()
    }
}
