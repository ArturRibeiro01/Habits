import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel : SplashViewModel
    
    var body: some View {
        
        Group {
        switch viewModel.uiState {
            case .loading :
                loadingView()
            case .goToSignInScreen :
                viewModel.SignInView()
            case .gotToHomeScreen:
                Text("Home...")
            case .error(let msg):
                loadingView(error: msg)
        }
        }.onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(Color("ColorBackground"))
                .ignoresSafeArea()
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)){
                        Alert(
                            title: Text("Alert"),
                            message: Text(error),
                            dismissButton: .default(Text("OK")))
                    }
            }
        }
    }
}

#Preview {
    SplashView(viewModel: SplashViewModel())
}
