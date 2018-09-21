//
//  Other.swift
//  Collections
//
//  Created by Erik Vildanov on 16.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

var oldX: CGFloat = 0
var oldPageIndex: Int = 0

struct Page {
    var title: String
    var image: [String]
}


let PAGES = [
    Page(title: "Car", image: ["https://images1.popmeh.ru/upload/img_cache/ea6/ea6f81717f3c11cd08c55e18c88239b6_ce_626x333x0x24_cropped_800x427.jpg",
                                "https://i.ytimg.com/vi/aga-HDC6TCI/maxresdefault.jpg",
                                "https://icdn.lenta.ru/images/2017/08/23/14/20170823145604779/pic_b21fd6a6551e45ce4a397c3c2662ec8f.jpg",
                                "https://www.avtovzglyad.ru/media/article/b3.jpg.740x555_q85_box-0%2C0%2C740%2C555_crop_detail_upscale.jpg",
                                "https://img.joinfo.ua/i/2017/08/599d6f972525a.jpg",
                                "https://360tv.ru/media/images/articles/crops/77525386-1bee-4df7-bb0d-30df00433686/crop_921_518.jpg",
                                "https://img03.rl0.ru/3a500a14a3a914dafbb749bfe8f7213c/c615x400/news.rambler.ru/img/2018/03/02103100.697928.3455.jpg",
                                "https://varlamov.me/2016/dushanbe_auto/09.jpg",
                                "https://cdn-4.motorsport.com/images/amp/6zQ8ROJY/s6/2021-concept-rendering-1.jpg",
                                "https://cdn.f1ne.ws/userfiles/122593.jpg",
                                "https://a.d-cd.net/fb589b2s-960.jpg",
                                "https://cs8.pikabu.ru/post_img/big/2017/04/02/6/1491122660131262702.jpg"]),
    Page(title: "Hous", image: ["https://b.3ddd.ru/media/gallery_images/5a4bb2767349e.jpeg",
                                 "https://ssl.cdn-redfin.com/photo/107/mbpaddedwide/897/genMid.F10070897_1.jpg",
                                 "https://i.pinimg.com/originals/f5/b8/c0/f5b8c0df21f63c5dea9d0d9525412699.jpg",
                                 "https://pp.userapi.com/c846324/v846324578/a6e61/FnfVIlDOnWs.jpg",
                                 "https://missingusa.files.wordpress.com/2015/05/american-foursquare-white.jpg",
                                 "https://reklamasevproduction.s3.amazonaws.com/useful_photo/image/2917/big_89fb9dc58e5f6918c139b54ef153a80e.jpg",
                                 "https://mydesigninfo.ru/wp-content/uploads/2016/02/Dizayn-doma.jpg",
                                 "https://images.homify.com/c_fill,f_auto,q_auto:eco,w_440/v1475076346/p/photo/image/1660640/IMG_4085-1.jpg",
                                 "https://www.ccnova.ru/media/com_hikashop/upload/thumbnails/372x573fsO/zagorodnyj-dom-v-stile-shale-s-dvuskatnoj-krovlej.jpg",
                                 "https://holz-house.ru/userfiles/holzhouse/technologii/preimdomov1300667.jpg",
                                 "https://i.ytimg.com/vi/sK0KarJX7IA/maxresdefault.jpg",
                                 "https://gotoroad.ru/assets/images/resources/231/kanada1.jpg"]),
]


protocol PushViewProtocol {
    func push(_ viewControllerToPush: UIViewController, animated: Bool)
}

protocol SourceViewProtocol {
    func pegister(soudceView: UIView)
}

protocol MoveLineAnimationProtocol {
    func moveLine(prosent: CGFloat)
}

extension UICollectionView {
    func cellForSubview(_ subview: UIView) -> UICollectionViewCell? {
        var superview = subview.superview
        
        while superview != nil {
            if superview is UICollectionViewCell {
                return superview as? UICollectionViewCell
            }
            
            superview = superview?.superview
        }
        
        return nil
    }
    
    func indexPathForSubview(_ subview: UIView) -> IndexPath? {
        if let cell = cellForSubview(subview) {
            return indexPath(for: cell)
        }
        
        return nil
    }
}
