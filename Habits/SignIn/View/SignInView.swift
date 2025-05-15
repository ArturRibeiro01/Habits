import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var action: Int? = 0
    
    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false){
                VStack(alignment: .center) {
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal,48)
                    
                    Text("Login")
                        .foregroundColor(Color("ColorPrimary"))
                        .font(Font.system(.title).bold())
                    
                    numberField
                    passwordField
                    enterButton
                    registerLink
                }
            }
        
        }


    }
}

extension SignInView {
    var numberField: some View {
        TextField("Email", text: $email)
            .border(Color.colorPrimary)
    }
}

extension SignInView {
    var passwordField: some View {
        SecureField("Senha", text: $password)
            .border(Color.colorPrimary)
    }
}

extension SignInView {
    var enterButton: some View {
        Button("Entrar"){
        }
    }
}

extension SignInView {
    var registerLink: some View {
        VStack{
            Text("Ainda não possui uma conta?")
                .padding(.top,48).foregroundColor(Color.gray)
            
            ZStack {
                NavigationLink(
                    destination: Text("Tela de Cadastro"),
                    tag: 1,
                    selection: $action
                ) {
                    EmptyView()
                }
                
                Button( "cadastre-se"){
                    self.action = 1
                }

            }
        }
    }
}



#Preview {
    let viewModel = SignInViewModel()
    let signIn = SignInView(viewModel: viewModel)
    return signIn
}
