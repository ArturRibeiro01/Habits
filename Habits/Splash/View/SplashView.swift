import SwiftUI

struct SplashView: View {
    
    @State private var state : SplashUIState = .loading
    
    var body: some View {
        
        switch state {
            case .loading :
                ZStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            maxWidth: .infinity ,
                            maxHeight: .infinity,
                        )
                        .background(Color("ColorPrimary"))
                }.ignoresSafeArea()
            case .goToSignInScreen :
                Text("SignIn...")
            case .gotToHomeScreen:
                Text("Home...")
            case .error(let msg):
                Text("Error: \(msg)")
        }
    }
}

#Preview {
    SplashView()
}
