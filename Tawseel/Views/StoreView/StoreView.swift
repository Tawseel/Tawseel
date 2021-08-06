/*
 See LICENSE folder for this sample’s licensing information.
 Abstract:
 A view showing the details for a landmark.
 */

import SwiftUI

struct StoreView: View {
    var itemModelData : ItemModelData = AppManager.Instance.itemModelData
    var storeDetails: StoreDetails
    @ObservedObject var imageLoader: ImageLoader
    @State private var showingPopover = false
    
    init(storeDetails: StoreDetails) {
        self.storeDetails = storeDetails
        imageLoader = ImageLoader()
    }
    
    var storeIndex: Int {
        storeDetails.id
    }
    
    var body: some View {
        ScrollView {
//            MapView(coordinate: storeDetails.locationCoordinate)
//                .ignoresSafeArea(edges: .top)
//                .frame(height: 260)
            
            CircleImage(image: imageLoader.loadImage(imageUrl: storeDetails.imagePath))
                .offset(y: 10)
                .padding(.bottom, -5)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(storeDetails.name)
                        .font(.title)
                    //                    FavoriteButton(isSet: store.isFeatured)
                }
                
                HStack {
                    Text(storeDetails.description)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                VStack {
                    ForEach(itemModelData.categories.keys.sorted(), id: \.self) { key in
                        ItemCategoryRow(categoryName: key, items: itemModelData.categories[key]!)
                    }.listRowInsets(EdgeInsets())
                    
                }
            }
            .padding()
        }
        .navigationTitle(storeDetails.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear()
        {
            self.itemModelData.loadItems(storeID: storeDetails.id)
        }
        
    }
}

struct StoreDetail_Previews: PreviewProvider {
    static var previews: some View {
        StoreView(storeDetails: ModelData().stores[0])
    }
}
