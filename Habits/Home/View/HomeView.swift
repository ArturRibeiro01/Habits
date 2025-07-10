import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel : HomeViewModel
    
    var body: some View {
        Text("Olá Home Page")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
