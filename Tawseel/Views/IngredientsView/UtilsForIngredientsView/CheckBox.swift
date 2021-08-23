import SwiftUI

struct CheckBoxView: View {
   @State var filters = [
        FilterItem(title: "Cheese", checked: false),
        FilterItem(title: "Halabeno", checked: false),
        FilterItem(title: "Pineapple", checked: false)
    ]

    var body: some View {
        VStack{
            Spacer()
            
            VStack{lineSpacing(18)
                
                HStack{
                    Text("Ingredients")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                
                Spacer()
                //add to cart button
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Done")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Green"))
                })
                .padding([.horizontal,.top])
                .padding(.bottom,10)
                
                ForEach(filters){filter in
                    
                    Text(filter.title)
                    
                }
                
            }
        }
    }
}

struct FilterItem: Identifiable{
    var id = UUID().uuidString
    var title: String
    var checked: Bool
}



struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView()
    }
}
