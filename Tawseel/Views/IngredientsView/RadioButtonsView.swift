import SwiftUI

struct RadioButtons : View {
    
    @Binding var selected : String
    @Binding var show : Bool
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Customize ingredients").font(.title).padding(.top)
            
            ForEach(data,id: \.self){i in
                
                Button(action: {
                    
                    self.selected = i
                    
                    
                }) {
                    
                    HStack{
                        
                        Text(i)
                        
                        Spacer()
                        
                        ZStack{
                            
                            Circle().fill(self.selected == i ? Color("Color") : Color.black.opacity(0.2)).frame(width: 18, height: 18)
                            
                            if self.selected == i{
                                
                                Circle().stroke(Color("Color1"), lineWidth: 4).frame(width: 25, height: 25)
                            }
                        }
                        
                    }.foregroundColor(.black)
                    
                }.padding(.top)
            }
            
            HStack{
                
                Spacer()
                
                 Button(action: {
                     
                    self.show.toggle()
                    //cart.add(item: item)
                    
                 }) {
                     
                     Text("Add to cart").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
                     
                 }
                 .background(
                    
                    self.selected != "" ?
                    
                    LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing) :
                    
                        LinearGradient(gradient: .init(colors: [Color.black.opacity(0.2),Color.black.opacity(0.2)]), startPoint: .leading, endPoint: .trailing)
                 
                 )
                .clipShape(Capsule())
                .disabled(self.selected != "" ? false : true)
                
                
            }.padding(.top)
            
        }.padding(.vertical)
        .padding(.horizontal,25)
        .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
        .background(Color.white)
        .cornerRadius(30)
    }
}
