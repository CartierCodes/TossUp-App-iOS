//
//  GrenadeButton.swift
//  TossUp
//
//  Created by Carter Burzlaff on 6/21/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

enum GrenadeType: CustomStringConvertible {
    case tsmoke
    case ctsmoke
    case fire
    case flashbang
    case he
    case target
    
    var description: String {
        switch self {
            case .tsmoke, .ctsmoke: return "smoke"
            case .fire: return "fire"
            case .flashbang: return "flashbang"
            case .he: return "he"
            case .target: return "target"
        }
    }
}

class GrenadeButton: UIButton {
    
    static let dust2: [GrenadeButton] = [
        GrenadeButton(.tsmoke, "aCross", 0.815, 0.245,
                      [GrenadeButton("aLong", 0.795, 0.485, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_aCross_from_aLong.mp4?alt=media&token=37e2c704-6d98-4bd7-a389-28a43aa32add")
        ]),
        GrenadeButton(.tsmoke, "aLong", 0.835, 0.455,
                      [GrenadeButton("tSpawn", 0.525, 0.865, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_aLong_from_tSpawn.mp4?alt=media&token=310b6beb-df34-489b-b4c0-0c01150e0f96"),
                       GrenadeButton("boxes", 0.6, 0.73, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_aLong_from_boxes.mp4?alt=media&token=c3302e48-e84d-4783-98d3-48c7b6ae8182")
        ]),
        GrenadeButton(.tsmoke, "cat", 0.665, 0.235,
                      [GrenadeButton("lowerCat", 0.655, 0.39, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_cat_from_lowerCat.mp4?alt=media&token=eb95752e-336a-4b26-8a41-ee5df11253d9")
        ]),
        GrenadeButton(.tsmoke, "bDoors", 0.255, 0.23,
                      [GrenadeButton("upperTunnelsCorner", 0.08, 0.475, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_bDoors_from_upperTunnelsCorner.mp4?alt=media&token=cc50c8a1-583d-4af4-8e54-ac9d328fd0a1"),
                       GrenadeButton("upperTunnelsCrate", 0.145, 0.44, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_bDoors_from_upperTunnelsCrate.mp4?alt=media&token=00c2c2e7-6a8c-45fe-99c4-3eeb2340ca9b")
        ]),
        GrenadeButton(.tsmoke, "bCar", 0.15, 0.285,
                      [GrenadeButton("upperTunnelsCratePillar", 0.155, 0.445, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_bCar_from_upperTunnelsCratePillar.mp4?alt=media&token=72fc8c21-2f96-4054-aecf-67373d1c8c0b")
        ]),
        GrenadeButton(.tsmoke, "bPlat", 0.11, 0.185,
                      [GrenadeButton("upperTunnelsPillar", 0.145, 0.485, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_bPlat_from_upperTunnelsPillar.mp4?alt=media&token=de8b97be-3ee1-454f-8c4d-8e38467a2b31")
        ]),
        GrenadeButton(.tsmoke, "bSite", 0.185, 0.2,
                      [GrenadeButton("upperTunnelsDoor", 0.175, 0.515, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_bSite_from_upperTunnelsDoor.mp4?alt=media&token=0e6b145e-49fe-42f8-892f-c7e818ca508c")
        ]),
        GrenadeButton(.tsmoke, "xBox", 0.485, 0.405,
                      [GrenadeButton("tSpawn", 0.49, 0.955, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_xBox_from_tSpawn.mp4?alt=media&token=b42e3c39-a758-4775-b589-e12701b448b0"),
                       GrenadeButton("carCorner", 0.675, 0.8, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_xBox_from_carCorner.mp4?alt=media&token=bb41e1ee-3a18-4b90-90c1-f7a8888f39f9")
        ]),
        GrenadeButton(.tsmoke, "ctCross", 0.495, 0.245,
                      [GrenadeButton("xBox", 0.485, 0.42, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_ctCross_from_xBox.mp4?alt=media&token=42ee39fd-575f-4c05-91f7-d463a81f3d93")
        ]),
        GrenadeButton(.tsmoke, "bCross", 0.41, 0.23,
                      [GrenadeButton("lowerTunnels", 0.435, 0.4, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_bCross_from_lowerTunnels.mp4?alt=media&token=c79bb105-47d6-4a71-b0e2-0cd604d92b41")
        ]),
        GrenadeButton(.tsmoke, "midDoors", 0.455, 0.355,
                      [GrenadeButton("tSpawn", 0.455, 0.9, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_midDoors_from_tSpawn.mp4?alt=media&token=d084c294-629f-48fa-865d-3bc8f95df34f")
        ]),
        
        
        GrenadeButton(.ctsmoke, "midCross", 0.45, 0.27,
                      [GrenadeButton("ctSpawn", 0.585, 0.225, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_smoke_midCross_from_ctSpawn.mp4?alt=media&token=e8fb9a3f-9022-4092-980f-26d45b6a74b7")
        ]),
        
        
        GrenadeButton(.fire, "aCar", 0.935, 0.275,
                      [GrenadeButton("aLongDoors", 0.745, 0.53, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_fire_aCar_from_aLongDoors.mp4?alt=media&token=31d573ee-735b-4708-8c3c-698d7ab838af")
        ]),
        GrenadeButton(.fire, "aSite", 0.8, 0.16,
                      [GrenadeButton("cat", 0.63, 0.305, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_fire_aSite_from_cat.mp4?alt=media&token=3d2d7106-3d41-4ae3-9970-9d13855322c1")
        ]),
        GrenadeButton(.fire, "bBackSite", 0.095, 0.045,
                      [GrenadeButton("upperTunnels", 0.12, 0.455, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_fire_bBackSite_from_upperTunnels.mp4?alt=media&token=347a3cf8-6e22-4243-93f1-d1e0ff013548")
        ]),
        GrenadeButton(.fire, "bWindow", 0.255, 0.125,
                      [GrenadeButton("upperTunnelsExit", 0.125, 0.315, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fdust2%2Fdust2_fire_bWindow_from_upperTunnelsExit.mp4?alt=media&token=c9dd3e6a-7e85-41c5-aca7-e8c75c5564c0")
        ])
    ]
    
    
    static let mirage: [GrenadeButton] = [
        GrenadeButton(.tsmoke, "aSite", 0.555, 0.725,
                      [GrenadeButton("tRoof", 0.78, 0.57, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_aSite_from_tRoof.mp4?alt=media&token=cc831c9a-41de-41da-af78-def91a85e336")
        ]),
        GrenadeButton(.tsmoke, "jungleAndConnector", 0.495, 0.65,
                      [GrenadeButton("tRoof", 0.79, 0.625, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_jungleAndConnector_from_tRoof.mp4?alt=media&token=02aed74b-f172-4bce-b0ec-c2b2c72110bc"),
                       GrenadeButton("tetris", 0.625, 0.62, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_jungleAndConnector_from_tetris.mp4?alt=media&token=a62d288f-e224-4dc2-b461-acc7e4e967a0"),
                       GrenadeButton("underpass", 0.435, 0.425, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_jungleAndConnector_from_underpass.mp4?alt=media&token=f1cef3ec-38a5-4386-902d-cf34e61c4fc9")
        ]),
        GrenadeButton(.tsmoke, "stairs", 0.545, 0.635,
                      [GrenadeButton("tFloor", 0.85, 0.565, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_stairs_from_tFloor.mp4?alt=media&token=27e764ef-0c01-4e62-b607-27d5fabfb49d"),
                       GrenadeButton("tetris", 0.625, 0.62, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_stairs_from_tetris.mp4?alt=media&token=4f6518d8-52f3-4ee0-923e-c8d75f6fabb7"),
        ]),
        GrenadeButton(.tsmoke, "ctSpawn", 0.465, 0.79,
                      [GrenadeButton("tFloor", 0.845, 0.525, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_ctSpawn_from_tFloor.mp4?alt=media&token=f924d9a8-38ae-46de-874a-450b2d706936"),
                       GrenadeButton("tSpawn", 0.88, 0.49, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_ctSpawn_from_tSpawn.mp4?alt=media&token=00faaa57-69fa-4749-b418-8f7efc38d2d8"),
                       GrenadeButton("tetris", 0.625, 0.62, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_ctSpawn_from_tetris.mp4?alt=media&token=db7a1440-fc44-4ce5-a748-a11509711db8")
        ]),
        GrenadeButton(.tsmoke, "cat", 0.475, 0.375,
                      [GrenadeButton("midBoxes", 0.72, 0.465, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_cat_from_midBoxes.mp4?alt=media&token=3f70a5ae-7730-4ce7-8401-abd2fe0b3a20")
        ]),
        GrenadeButton(.tsmoke, "mid", 0.605, 0.425,
                      [GrenadeButton("tSpawn", 0.905, 0.325, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_mid_from_tSpawn.mp4?alt=media&token=69e2c001-84f4-407e-b62f-f2afccd1fc3f")
        ]),
        GrenadeButton(.tsmoke, "snipers", 0.4, 0.455,
                      [GrenadeButton("midBoxes", 0.72, 0.455, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_snipers_from_midBoxes.mp4?alt=media&token=56886852-926c-477b-8b94-6c062bdba1de"),
                       GrenadeButton("underpass", 0.435, 0.425, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_snipers_from_underpass.mp4?alt=media&token=54d1e756-2f98-4622-af56-8893e6a83249")
        ]),
        GrenadeButton(.tsmoke, "marketWindow", 0.255, 0.38,
                      [GrenadeButton("apps", 0.595, 0.165, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_marketWindow_from_apps.mp4?alt=media&token=b4d2484d-b06e-40f0-a525-a96498e296fb")
        ]),
        GrenadeButton(.tsmoke, "marketDoor", 0.175, 0.38,
                      [GrenadeButton("apps", 0.595, 0.165, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_marketDoor_from_apps.mp4?alt=media&token=95d8b9cd-eab1-4403-afd7-5de5c323b540")
        ]),
        GrenadeButton(.tsmoke, "leftArch", 0.345, 0.24,
                      [GrenadeButton("apps", 0.515, 0.21, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_leftArch_from_apps.mp4?alt=media&token=63c8d84e-58ae-404d-929f-bea98a68875b")
        ]),
        GrenadeButton(.tsmoke, "rightArch", 0.345, 0.29,
                      [GrenadeButton("apps", 0.465, 0.21, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_rightArch_from_apps.mp4?alt=media&token=dbb49c47-20f8-4131-b28f-70b3c80549ed")
        ]),
        GrenadeButton(.tsmoke, "bench", 0.18, 0.23,
                      [GrenadeButton("apps", 0.5275, 0.23, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_bench_from_apps.mp4?alt=media&token=d6484a5e-0fd5-481e-8b7d-e29a67a41d5a")
        ]),
        
        
        GrenadeButton(.ctsmoke, "aRamp", 0.68, 0.625,
                      [GrenadeButton("ctSpawn", 0.465, 0.775, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_aRamp_from_triple.mp4?alt=media&token=26186f07-4128-472e-9878-da700df5fd2b"),
                       GrenadeButton("ninja", 0.56, 0.795, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_aRamp_from_ninja.mp4?alt=media&token=1050f58a-1bf0-428a-9afb-fde3d3ea64c8")
        ]),
        GrenadeButton(.ctsmoke, "palace", 0.645, 0.775,
                      [GrenadeButton("underPalace", 0.655, 0.735, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_palace_from_underPalace.mp4?alt=media&token=26f610ba-72f0-4bc1-8bf5-f20d76371297"),
                       GrenadeButton("connecter", 0.505, 0.595, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_smoke_palace_from_connector.mp4?alt=media&token=0a93d9d2-3711-476b-850d-b9328085413c")
        ]),
        
        GrenadeButton(.fire, "palace", 0.645, 0.785,
                      [GrenadeButton("underPalace", 0.655, 0.735, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_fire_palace_from_underPalace.mp4?alt=media&token=604a6825-270f-4635-88ff-8c404303c47b"),
                       GrenadeButton("connecter", 0.505, 0.595, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_fire_palace_from_connector.mp4?alt=media&token=0c752e06-4c9f-4507-a976-e545dbfdf17a")
        ]),
        GrenadeButton(.fire, "underPalace", 0.645, 0.725,
                      [GrenadeButton("palace", 0.75, 0.765, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_fire_snipers_from_midBoxes.mp4?alt=media&token=8e97fac7-c0a4-4801-b240-bb265cd4d05e"),
                       GrenadeButton("aRamp", 0.665, 0.625, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_fire_underPalace_from_aRamp.mp4?alt=media&token=be5fc173-9330-4b6c-b89e-a33fe4a07bac")
        ]),
        GrenadeButton(.fire, "firebox", 0.595, 0.785,
                      [GrenadeButton("tetris", 0.625, 0.62, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_fire_firebox_from_tetris.mp4?alt=media&token=0f318291-a5f5-4c34-b507-aedb2e1132db")
        ]),
        GrenadeButton(.fire, "sandwich", 0.575, 0.635,
                      [GrenadeButton("tRoof", 0.815, 0.575, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_fire_sandwich_from_tRoof.mp4?alt=media&token=945cf958-ce21-444e-b11b-ec04d723c71f")
        ]),
        GrenadeButton(.fire, "triple", 0.485, 0.745,
                      [GrenadeButton("tetris", 0.625, 0.62, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_fire_triple_from_tetris.mp4?alt=media&token=42c96562-2ba0-4eb9-b337-f593ebfb605c")
        ]),
        GrenadeButton(.fire, "snipers", 0.4, 0.455,
                      [GrenadeButton("midBoxes", 0.72, 0.455, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_fire_snipers_from_midBoxes.mp4?alt=media&token=8e97fac7-c0a4-4801-b240-bb265cd4d05e")
        ]),
        GrenadeButton(.fire, "connecter", 0.505, 0.505,
                      [GrenadeButton("midPeek", 0.675, 0.37, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fmirage%2Fmirage_fire_connector_from_midPeek.mp4?alt=media&token=380c14d5-ccb0-4bb1-97de-544300f8e414")
        ])
    ]
    
    static let inferno: [GrenadeButton] = [
        GrenadeButton(.tsmoke, "aSite", 0.82, 0.72,
                      [GrenadeButton("flowers", 0.57, 0.725, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_aSite_from_flowers.mp4?alt=media&token=16c04290-39b7-47ab-ba02-adb7a5001aba")
        ]),
        GrenadeButton(.tsmoke, "pit", 0.855, 0.765,
                      [GrenadeButton("altMid", 0.555, 0.77, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_pit_from_altMid.mp4?alt=media&token=b766db83-1c77-45ea-a1ac-d75eba70b74a")
        ]),
        GrenadeButton(.tsmoke, "balcony", 0.82, 0.805,
                      [GrenadeButton("altMid", 0.555, 0.77, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_balcony_from_altMid.mp4?alt=media&token=aaad90a6-f12e-49ab-9076-20677a6d3653")
        ]),
        GrenadeButton(.tsmoke, "arch", 0.78, 0.5,
                      [GrenadeButton("flowers", 0.57, 0.725, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_arch_from_flowers.mp4?alt=media&token=637479c7-e1fb-4060-9c13-34540e0b333c")
        ]),
        GrenadeButton(.tsmoke, "libraryCross", 0.835, 0.5455,
                      [GrenadeButton("door", 0.48, 0.81, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_libraryCross_from_door.mp4?alt=media&token=8ef4ed10-41c1-4dd9-afe0-fdbc5715f4ce")
        ]),
        GrenadeButton(.tsmoke, "topMid", 0.65, 0.665,
                      [GrenadeButton("tSpawn", 0.25, 0.6755, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_topMid_from_tSpawn.mp4?alt=media&token=75a45283-bb6a-4863-8e0c-35f34c89e006")
        ]),
        GrenadeButton(.tsmoke, "leftMid", 0.695, 0.63,
                      [GrenadeButton("mid", 0.455, 0.67, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_leftMid_from_mid.mp4?alt=media&token=2d5fdf6d-898b-4e41-9a69-7446a66fad35"),
                       GrenadeButton("flowers", 0.57, 0.725, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_leftMid_from_flowers.mp4?alt=media&token=f2fc9283-bd59-4be7-9b8f-f2927066c53f")
        ]),
        GrenadeButton(.tsmoke, "rightMid", 0.695, 0.71,
                      [GrenadeButton("mexico", 0.475, 0.645, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_rightMid_from_mexico.mp4?alt=media&token=02ab6977-de22-4e66-ab0c-87540276ea15"),
                       GrenadeButton("flowers", 0.57, 0.725, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_rightMid_from_flowers.mp4?alt=media&token=1f415a5d-8a64-4764-ae2e-3710a7f297ef")
        ]),
        GrenadeButton(.tsmoke, "coffin", 0.51, 0.13,
                      [GrenadeButton("bananaLogs", 0.44, 0.455, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_coffin_from_bananaLogs.mp4?alt=media&token=ddfb903f-fb5c-44c6-8c84-096d3975661c"),
                       GrenadeButton("banana", 0.485, 0.435, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_coffin_from_banana.mp4?alt=media&token=51e02382-93b0-4ef8-8d22-f18601f37a67")
        ]),
        GrenadeButton(.tsmoke, "ctSpawn", 0.61, 0.23,
                      [GrenadeButton("bananaLog", 0.44, 0.455, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_ctSpawn_from_bananaLog.mp4?alt=media&token=f1cd4358-8013-4042-b057-357a9ac990fe"),
                       GrenadeButton("banana", 0.485, 0.435, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_ctSpawn_from_banana.mp4?alt=media&token=1dc7895d-c3ce-4d2a-8450-59215071ded7")
        ]),
        GrenadeButton(.tsmoke, "bSite", 0.535, 0.245,
                      [GrenadeButton("banana", 0.51, 0.4, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_smoke_bSite_from_banana.mp4?alt=media&token=b26bc913-e3bd-4065-8ff4-aac3671942ce")
        ]),

        GrenadeButton(.fire, "aSite", 0.815, 0.66,
                      [GrenadeButton("arch", 0.815, 0.53, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_fire_aSite_from_arch.mp4?alt=media&token=49b2df14-06fc-4869-be9c-870b60cfbe45")
        ]),
        GrenadeButton(.fire, "bSiteClose", 0.4925, 0.27,
                      [GrenadeButton("banana", 0.5, 0.37, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_fire_bSiteClose_from_banana.mp4?alt=media&token=41575b9a-b138-49d7-bdb7-b139f8c93f2b")
        ]),
        GrenadeButton(.fire, "bDark", 0.425, 0.145,
                      [GrenadeButton("banana", 0.5, 0.405, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_fire_bDark_from_banana.mp4?alt=media&token=963fb631-a663-4175-88b9-db05a2e07fd5")
        ]),
        GrenadeButton(.fire, "bBackSite", 0.425, 0.25,
                      [GrenadeButton("banana", 0.505, 0.37, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_fire_bBackSite_from_banana.mp4?alt=media&token=482ef42e-bd61-4a6b-a5dd-8f71db6b5006")
        ]),
        GrenadeButton(.fire, "bSite", 0.51, 0.185,
                      [GrenadeButton("church", 0.64, 0.14, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_fire_bSite_from_church.mp4?alt=media&token=c4d3788c-3d29-46f4-b49c-611f8fa735cf")
        ]),
        GrenadeButton(.fire, "flowerBoost", 0.61, 0.2325,
                      [GrenadeButton("bananaPeek", 0.55, 0.35, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Finferno%2Finferno_fire_flowerBoost_from_bananaPeek.mp4?alt=media&token=1b1dd7f0-0024-41ae-9110-426a6e1e88de")
        ])
    ]
    
    static let cache: [GrenadeButton] = [
        GrenadeButton(.tsmoke, "aDefault", 0.345, 0.22,
                      [GrenadeButton("aLong", 0.585, 0.33, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_aDefault_from_aLong.mp4?alt=media&token=b1129ab2-c589-44fa-88b1-e259acd9fa33")
        ]),
        GrenadeButton(.tsmoke, "aCross", 0.365, 0.3,
                      [GrenadeButton("aLong", 0.585, 0.295, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_aCross_from_aLong.mp4?alt=media&token=d7d9ea1b-07a4-4352-b81c-184c95b8a4f6"),
                       GrenadeButton("aMain", 0.485, 0.36, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_aCross_from_aMain.mp4?alt=media&token=73b9f519-9acc-4265-8a02-eac23d930e7b"),
                       GrenadeButton("squeaky", 0.385, 0.18, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_aCross_from_squeaky.mp4?alt=media&token=cb40c61b-4fdb-41b8-a004-36f1ea5c18b7")
        ]),
        GrenadeButton(.tsmoke, "cat", 0.34, 0.335,
                      [GrenadeButton("aLong", 0.585, 0.295, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_cat_from_aLong.mp4?alt=media&token=a4a97511-dfed-4508-8613-37b4a6724615")
        ]),
        GrenadeButton(.tsmoke, "upperHighway", 0.325, 0.39,
                      [GrenadeButton("vent", 0.45, 0.55, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_upperHighway_from_vent.mp4?alt=media&token=1cb005ff-6e64-44ca-a6af-57fe7435ac88")
        ]),
        GrenadeButton(.tsmoke, "lowerHighway", 0.325, 0.475,
                      [GrenadeButton("useless", 0.585, 0.645, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_lowerHighway_from_useless.mp4?alt=media&token=04c49dd5-3ade-4c18-ad5d-40c99a04169a")
        ]),
        GrenadeButton(.tsmoke, "connector", 0.29, 0.58,
                      [GrenadeButton("tSpawn", 0.805, 0.58, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_connector_from_tSpawn.mp4?alt=media&token=643446b1-e8eb-4ff9-837d-e33510e49af9")
        ]),
        GrenadeButton(.tsmoke, "leftMid", 0.41, 0.545,
                      [GrenadeButton("garage", 0.66, 0.525, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_leftMid_from_garage.mp4?alt=media&token=5b7262ad-4b34-40b9-97e3-9ef8d6c12f7f")
        ]),
        GrenadeButton(.tsmoke, "rightMid", 0.41, 0.505,
                      [GrenadeButton("garage", 0.66, 0.535, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_rightMid_from_garage.mp4?alt=media&token=264f92f6-88ac-4c4c-a714-eb5197c73df3")
        ]),
        GrenadeButton(.tsmoke, "bMain", 0.3975, 0.685,
                      [GrenadeButton("bHalls", 0.585, 0.685, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_bMain_from_bHalls.mp4?alt=media&token=dbc366d9-db3a-447b-8654-d2ef020b38ce")
        ]),
        GrenadeButton(.tsmoke, "bSite", 0.36, 0.77,
                      [GrenadeButton("sunroom", 0.53, 0.825, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_bSite_from_sunroom.mp4?alt=media&token=5926d22a-5aca-49f9-b3a5-ed88453dbda5")
        ]),
        GrenadeButton(.tsmoke, "checkers", 0.415, 0.64,
                      [GrenadeButton("bHalls", 0.52, 0.725, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_checkers_from_bHalls.mp4?alt=media&token=0a95753c-d0fc-4b83-a909-49a421489706")
        ]),
        GrenadeButton(.tsmoke, "hell", 0.26, 0.74,
                      [GrenadeButton("sunroom", 0.53, 0.825, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_hell_from_sunroom.mp4?alt=media&token=d42d8041-b5fc-49dd-8bbb-c819e9aa6fe6")
        ]),

        
        GrenadeButton(.ctsmoke, "aMain", 0.44, 0.27,
                      [GrenadeButton("truck", 0.22, 0.37, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_aMain_from_truck.mp4?alt=media&token=ee05e219-a09d-47ab-9008-ccfc3e4cc4ae")
        ]),
        GrenadeButton(.ctsmoke, "garage", 0.5, 0.525,
                      [GrenadeButton("connecterWindow", 0.28, 0.545, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_garage_from_connecterWindow.mp4?alt=media&token=2842bdfb-c2d1-43a4-aabc-f7da6b47753e"),
                       GrenadeButton("connectorDoor", 0.28, 0.585, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_garage_from_connectorDoor.mp4?alt=media&token=712529ff-25c3-4edd-abc7-3715722a71c7"),
                       GrenadeButton("whitebox", 0.315, 0.48, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_garage_from_whitebox.mp4?alt=media&token=e66ef613-877e-4223-8c13-32b0b36c0438")
        ]),
        GrenadeButton(.ctsmoke, "boost", 0.515, 0.465,
                      [GrenadeButton("sandbags", 0.36, 0.59, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_boost_from_sandbags.mp4?alt=media&token=5411927a-e696-4d99-b7d8-b3eb0328c058")
        ]),
        GrenadeButton(.ctsmoke, "bHalls", 0.44, 0.725,
                      [GrenadeButton("bSite", 0.33, 0.75, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_bHalls_from_bSite.mp4?alt=media&token=dca97d16-43ee-4e7a-9d9e-7aeed52d829e"),
                       GrenadeButton("heaven", 0.275, 0.71, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_smoke_bHalls_from_heaven.mp4?alt=media&token=c3032e4e-044b-4a86-9f5a-93ac8a3ce7a1")
        ]),
        
        
        GrenadeButton(.fire, "whitebox", 0.33, 0.49,
                      [GrenadeButton("bottomBoost", 0.58, 0.46, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_fire_whitebox_from_bottomBoost.mp4?alt=media&token=07ae2906-e72a-4769-9356-9bfed0f9a782")
        ]),
        GrenadeButton(.fire, "bSite", 0.31, 0.8,
                      [GrenadeButton("sunroom", 0.53, 0.825, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_fire_bSite_from_sunroom.mp4?alt=media&token=4431f8c6-c939-4388-a1d9-b1143f30377b")
        ]),
        GrenadeButton(.fire, "bBackSite", 0.37, 0.82,
                      [GrenadeButton("sunroom", 0.47, 0.805, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_fire_bBackSite_from_sunroom.mp4?alt=media&token=975bdcbd-73dc-4414-bb60-8987a9b9588f")
        ]),
        GrenadeButton(.fire, "checkers", 0.415, 0.64,
                      [GrenadeButton("bHalls", 0.52, 0.725, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fcache%2Fcache_fire_checkers_from_bHalls.mp4?alt=media&token=d87d22fc-f82f-4d46-97ce-2018b8c6ca2f")
        ])
    ]
    
    static let overpass: [GrenadeButton] = [
        GrenadeButton(.tsmoke, "aDefault", 0.43, 0.1675,
                      [GrenadeButton("aLong", 0.225, 0.36, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_aDefault_from_aLong.mp4?alt=media&token=707d4232-1156-4ee3-9d0c-e2c0c34bd03a"),
                       GrenadeButton("woodDoor", 0.285, 0.39, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_aDefault_from_woodDoor.mp4?alt=media&token=7879bcd2-b92e-4b6b-a837-ba4bf457ecae")
        ]),
        GrenadeButton(.tsmoke, "aSite", 0.47, 0.205,
                      [GrenadeButton("highway", 0.47, 0.49, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_aSite_from_highway.mp4?alt=media&token=67f02846-9af8-44fd-afc2-d60e57003455")
        ]),
        GrenadeButton(.tsmoke, "aStairs", 0.525, 0.15,
                      [GrenadeButton("aLong", 0.23, 0.355, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_aStairs_from_aLong.mp4?alt=media&token=3a8d185b-d8ec-4c59-a954-4935e7546d50"),
                       GrenadeButton("highway", 0.47, 0.4725, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_aStairs_from_highway.mp4?alt=media&token=dbc0cf5c-9c4c-4f2c-8247-f6cc2f2098f6")
        ]),
        GrenadeButton(.tsmoke, "bank", 0.44, 0.12,
                      [GrenadeButton("aLong", 0.225, 0.36, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_bank_from_aLong.mp4?alt=media&token=02fa2bdc-390a-4bbf-b0c4-3a5e55a63547"),
                       GrenadeButton("aShort", 0.5, 0.43, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_bank_from_aShort.mp4?alt=media&token=7b1abafb-ee07-41cb-bcd5-f989afdb5659"),
                       GrenadeButton("woodDoor", 0.285, 0.39, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_bank_from_woodDoor.mp4?alt=media&token=db4fd8f7-de37-40e8-9229-fd3db8baa7ef")
        ]),
        GrenadeButton(.tsmoke, "truck", 0.515, 0.22,
                      [GrenadeButton("highway", 0.47, 0.49, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_truck_from_highway.mp4?alt=media&token=b2775beb-994e-400c-81dd-5575901b8b4e")
        ]),
        GrenadeButton(.tsmoke, "aShort", 0.49, 0.43,
                      [GrenadeButton("upperTunnelsExit", 0.53, 0.82, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_aShort_from_upperTunnelsExit.mp4?alt=media&token=751e7cee-0f59-428e-948a-aae9913c242b")
        ]),
        GrenadeButton(.tsmoke, "bathroom", 0.41, 0.52,
                      [GrenadeButton("tSpawn", 0.765, 0.7525, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_bathroom_from_tSpawn.mp4?alt=media&token=c0aa0e59-bbc3-4930-97a7-674a02188ae5")
        ]),
        GrenadeButton(.tsmoke, "bSite", 0.7, 0.315,
                      [GrenadeButton("alley", 0.79, 0.62, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_bSite_from_alley.mp4?alt=media&token=4ed99e72-dd0e-407d-b3e5-b5ca881884bf"),
                       GrenadeButton("connectorDoor", 0.585, 0.495, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_bSite_from_connectorDoor.mp4?alt=media&token=dfda62ce-96cc-4882-bbaf-52b0af06cf6d")
        ]),
        GrenadeButton(.tsmoke, "leftSidePillar", 0.74, 0.35,
                      [GrenadeButton("alley", 0.765, 0.695, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_leftSidePillar_from_alley.mp4?alt=media&token=22010646-c5f6-440f-b20a-8fd1a4b7b9e3")
        ]),
        GrenadeButton(.tsmoke, "rightSidePillar", 0.75, 0.285,
                      [GrenadeButton("connectorDoor", 0.585, 0.455, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_rightSidePillar_from_connectorDoor.mp4?alt=media&token=649fb7e1-dbab-4cd8-a232-9219514d8508"),
                       GrenadeButton("monster", 0.79, 0.55, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_rightSidePillar_from_monster.mp4?alt=media&token=9be6423b-d3a3-4711-829c-72d4ef35c56e")
        ]),
        GrenadeButton(.tsmoke, "bridge", 0.69, 0.3725,
                      [GrenadeButton("alley", 0.79, 0.62, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_bridge_from_alley.mp4?alt=media&token=c51314ff-6f9f-4ca7-bf6f-57e1457e8fe7"),
                       GrenadeButton("water", 0.615, 0.45, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_bridge_from_water.mp4?alt=media&token=384d0cb1-5a8d-4512-a21d-ec337c658505")
        ]),
        GrenadeButton(.tsmoke, "heaven", 0.585, 0.24,
                      [GrenadeButton("connectorDoor", 0.58, 0.455, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_heaven_from_connectorDoor.mp4?alt=media&token=563dec3e-d98e-404d-bf68-36817682d35e"),
                       GrenadeButton("water", 0.615, 0.465, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_smoke_heaven_from_water.mp4?alt=media&token=1f0fb8b4-abc0-4288-a276-ecbeeeafd0c6")
        ]),
        
        
        GrenadeButton(.fire, "aSite", 0.43, 0.2175,
                      [GrenadeButton("bathroom", 0.405, 0.355, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_fire_aSite_from_bathroom.mp4?alt=media&token=247551d5-7832-4f52-bbfc-971a4073d831")
        ]),
        GrenadeButton(.fire, "bBarrels", 0.75, 0.25,
                      [GrenadeButton("connector", 0.58, 0.52, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Foverpass%2Foverpass_fire_bBarrels_from_connector.mp4?alt=media&token=54ef0895-a548-48d5-84f1-c27b8d956520")
        ])
    ]
    
    static let train: [GrenadeButton] = [
        GrenadeButton(.tsmoke, "aLeftSite", 0.59, 0.48,
                      [GrenadeButton("mail", 0.42, 0.22, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_aLeftSite_from_mail.mp4?alt=media&token=46c6eb3d-8cd0-4e20-aecd-2291c97b3c16")
        ]),
        GrenadeButton(.tsmoke, "bombTrain", 0.64, 0.5,
                      [GrenadeButton("tSpawn", 0.3725, 0.26, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_bombTrain_from_tSpawn.mp4?alt=media&token=e96f1134-b501-4574-bd9d-db2948d7e44c")
        ]),
        GrenadeButton(.tsmoke, "aRightSite", 0.59, 0.54,
                      [GrenadeButton("topLadder", 0.38, 0.58, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_aRightSite_from_topLadder.mp4?alt=media&token=8751528a-f152-467b-9cfd-87b04442e2db")
        ]),
        GrenadeButton(.tsmoke, "aConnector", 0.625, 0.57,
                      [GrenadeButton("mail", 0.42, 0.22, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_aConnector_from_mail.mp4?alt=media&token=30256c57-a7ae-46d3-98ce-ae3d0bf007d2")
        ]),
        GrenadeButton(.tsmoke, "betweenBlueAndOrange", 0.515, 0.42,
                      [GrenadeButton("tSpawnTrainLeft", 0.385, 0.15, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_betweenBlueAndOrange_from_tSpawnTrainLeft.mp4?alt=media&token=bf75b10f-85de-43fc-bbf5-72322c08a718")
        ]),
        GrenadeButton(.tsmoke, "leftGreen", 0.6, 0.365,
                      [GrenadeButton("topLadder", 0.375, 0.615, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_leftGreen_from_topLadder.mp4?alt=media&token=7ef875a7-6ba9-4c28-8926-9eec87aa4729")
        ]),
        GrenadeButton(.tsmoke, "leftBlue", 0.515, 0.365,
                      [GrenadeButton("tSpawn", 0.39, 0.235, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_leftBlue_from_tSpawn.mp4?alt=media&token=19b33733-d836-4065-9cc2-6c6689c35481")
        ]),
        GrenadeButton(.tsmoke, "leftEBox", 0.5, 0.48,
                      [GrenadeButton("tSpawnTrainLeft", 0.3825, 0.15, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_leftEBox_from_tSpawnTrainLeft.mp4?alt=media&token=74793193-8978-4528-8f9b-85d26046944a"),
                       GrenadeButton("tSpawnTrainRight", 0.4175, 0.1475, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_leftEBox_from_tSpawnTrainRight.mp4?alt=media&token=2b4377ca-cead-490b-8fbf-b13478eca4b8")
        ]),
        GrenadeButton(.tsmoke, "greenPeek", 0.71, 0.405,
                      [GrenadeButton("topLadder", 0.375, 0.615, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_greenPeek_from_topLadder.mp4?alt=media&token=430c9f43-e2ab-46ef-9670-51a47b9dfd8f")
        ]),
        GrenadeButton(.tsmoke, "rightIvy", 0.755, 0.395,
                      [GrenadeButton("topLadder", 0.385, 0.59, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_rightIvy_from_topLadder.mp4?alt=media&token=f8dc4115-f0c3-4b65-9c55-bb619fff881a"),
                       GrenadeButton("alley", 0.81, 0.19, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_rightIvy_from_alley.mp4?alt=media&token=3078fc18-deda-410a-8099-203eb3bb8643")
        ]),
        GrenadeButton(.tsmoke, "leftIvy", 0.845, 0.395,
                      [GrenadeButton("alley", 0.83, 0.14, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_leftIvy_from_alley.mp4?alt=media&token=86f43901-3e3e-4bb1-8371-63a1ba460191")
        ]),
        GrenadeButton(.tsmoke, "bConnector", 0.73, 0.675,
                      [GrenadeButton("brownHalls", 0.29, 0.71, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_bConnector_from_brownHalls.mp4?alt=media&token=1d90e03c-de22-437a-b9da-d2482b28f8e0")
        ]),
        GrenadeButton(.tsmoke, "bLeftSite", 0.5, 0.73,
                      [GrenadeButton("brownHalls", 0.29, 0.77, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_bLeftSite_from_brownHalls.mp4?alt=media&token=73831b38-442a-4334-ad3a-eef08ba474f7")
        ]),
        GrenadeButton(.tsmoke, "bLower", 0.53, 0.68,
                      [GrenadeButton("brownHalls", 0.29, 0.71, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_bLower_from_brownHalls.mp4?alt=media&token=10a93c4c-2fb8-4ef4-b3af-b6b0533f795e")
        ]),
        GrenadeButton(.tsmoke, "bUpper", 0.47, 0.85,
                      [GrenadeButton("brownHalls", 0.31, 0.81, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_bUpper_from_brownHalls.mp4?alt=media&token=72aa1ebf-336e-4660-a8d6-4a05f39bad00")
        ]),
        
        
        GrenadeButton(.ctsmoke, "tMain", 0.405, 0.38,
                      [GrenadeButton("oldBomb", 0.745, 0.54, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_smoke_tMain_from_oldBomb.mp4?alt=media&token=bb8e32ac-4318-454a-8392-3a562c0b463f")
        ]),
        
        
        GrenadeButton(.fire, "bDefault", 0.46, 0.76,
                      [GrenadeButton("brownHalls", 0.31, 0.81, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_fire_bDefault_from_brownHalls.mp4?alt=media&token=db472b82-8248-46fb-9e0f-7227f2fb2b37")
        ]),
        GrenadeButton(.fire, "grey", 0.56, 0.705,
                      [GrenadeButton("brownHalls", 0.31, 0.71, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_fire_grey_from_brownHalls.mp4?alt=media&token=e4af1c86-7f9c-48eb-92bc-f84df8319cc3")
        ]),
        GrenadeButton(.fire, "ladderDoor", 0.435, 0.56,
                      [GrenadeButton("topLadder", 0.38, 0.59, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_fire_ladderDoor_from_topLadder.mp4?alt=media&token=6e58ebd8-a3c0-4748-9aa7-fc41e5bb3b2e")
        ]),
        GrenadeButton(.fire, "sandwich", 0.55, 0.39,
                      [GrenadeButton("tMain", 0.38, 0.39, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Ftrain%2Ftrain_fire_sandwich_from_tMain.mp4?alt=media&token=e5084c3a-44ce-4de2-a9f7-32994631fa4e")
        ]),
    ]
    
    static let nuke: [GrenadeButton] = [
        GrenadeButton(.tsmoke, "midCross", 0.55, 0.41,
                      [GrenadeButton("tSpawn", 0.43, 0.36, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_midCross_from_tSpawn.mp4?alt=media&token=bc420314-382f-409e-a1b4-7a94b0d69154")
        ]),
        GrenadeButton(.tsmoke, "firstWall", 0.605, 0.435,
                      [GrenadeButton("tContainer", 0.435, 0.31, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_firstWall_from_tContainer.mp4?alt=media&token=838d0c68-fdf5-417d-8dc2-053bc56cb79f")
        ]),
        GrenadeButton(.tsmoke, "secondWall", 0.655, 0.435,
                      [GrenadeButton("outside", 0.475, 0.39, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_secondWall_from_outside.mp4?alt=media&token=d88a416d-0c90-4d40-a99f-049fd835aea5")
        ]),
        GrenadeButton(.tsmoke, "garage", 0.68, 0.39,
                      [GrenadeButton("outside", 0.45, 0.395, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_garage_from_outside.mp4?alt=media&token=efb3127b-1213-4742-93a3-430c6bc3ae9e"),
                       GrenadeButton("tContainer", 0.43, 0.33, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_garage_from_tContainer.mp4?alt=media&token=009c6a59-69ad-4cb0-b495-e9f4d2b61893")
        ]),
        GrenadeButton(.tsmoke, "blue", 0.645, 0.345,
                      [GrenadeButton("outside", 0.47, 0.34, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_blue_from_outside.mp4?alt=media&token=4113a19c-234d-44cf-912a-2b9b9ec17245")
        ]),
        GrenadeButton(.tsmoke, "aMain", 0.575, 0.34,
                      [GrenadeButton("roof", 0.455, 0.2, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_aMain_from_roof.mp4?alt=media&token=8e3ccda1-2387-4d61-a54b-96311f52069b")
        ]),
        GrenadeButton(.tsmoke, "aSite", 0.545, 0.215,
                      [GrenadeButton("lobby", 0.495, 0.25, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_aSite_from_lobby.mp4?alt=media&token=a730c94b-41c0-44ba-a035-528debc011ee")
        ]),
        GrenadeButton(.tsmoke, "rampBoxes", 0.54, 0.09,
                      [GrenadeButton("trophyRoom", 0.51, 0.19, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_rampBoxes_from_trophyRoom.mp4?alt=media&token=702c7e8f-24ac-4e3a-bd9c-c8c718180f6e")
        ]),
        GrenadeButton(.tsmoke, "rampCross", 0.57, 0.125,
                      [GrenadeButton("trophyRoom", 0.51, 0.21, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_rampCross_from_trophyRoom.mp4?alt=media&token=cac8f3a2-bb42-421f-b69f-0e48157fd955")
        ]),


        GrenadeButton(.ctsmoke, "outside", 0.6, 0.4,
                      [GrenadeButton("blue", 0.665, 0.3, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_outside_from_blue.mp4?alt=media&token=4d2a8332-7bf8-409b-8b95-cde244773f1c"),
                       GrenadeButton("outsideGarage", 0.75, 0.305, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_outside_from_outsideGarage.mp4?alt=media&token=f79d3ac2-9f7a-47db-a3c3-04e251f466b2")
        ]),
        GrenadeButton(.ctsmoke, "outsideDeep", 0.52, 0.44,
                      [GrenadeButton("ctSpawn", 0.75, 0.21, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_outsideDeep_from_ctSpawn.mp4?alt=media&token=1f43ffc0-9d29-474b-bb28-dd1edd260841")
        ]),
        GrenadeButton(.ctsmoke, "trophyRoom", 0.505, 0.175,
                      [GrenadeButton("rampCross", 0.57, 0.12, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_smoke_trophyRoom_from_rampCross.mp4?alt=media&token=51f87dbc-1808-4bf4-acac-bffbce9dc0f6")
        ]),

        
        GrenadeButton(.fire, "blue", 0.675, 0.3475,
                      [GrenadeButton("silo", 0.4925, 0.365, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_fire_blue_from_silo.mp4?alt=media&token=66a1b8a9-bbe1-4ab3-b4fc-49726d352032")
        ]),
        GrenadeButton(.fire, "bNook", 0.5975, 0.705,
                      [GrenadeButton("bottomRamp", 0.59, 0.64, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_fire_bNook_from_bottomRamp.mp4?alt=media&token=efe8593a-e6a7-47ff-9255-516f367d27ef")
        ]),
        GrenadeButton(.fire, "bSite", 0.59, 0.82,
                      [GrenadeButton("bottomRamp", 0.59, 0.64, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fnuke%2Fnuke_fire_bSite_from_bottomRamp.mp4?alt=media&token=56f95e00-e5f8-4391-a145-1742f135a3ba")
        ])
    ]
    
    static let vertigo: [GrenadeButton] = [
        GrenadeButton(.tsmoke, "aLeftSite", 0.67, 0.54,
                      [GrenadeButton("ramp", 0.605, 0.675, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_aLeftSite_from_ramp.mp4?alt=media&token=d9082f95-65dc-458d-862f-286c112b9259"),
                       GrenadeButton("rampCorner", 0.5625, 0.75, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_aLeftSite_from_rampCorner.mp4?alt=media&token=e3179dc1-774f-4e62-8d81-1030e25a93df")
        ]),
        GrenadeButton(.tsmoke, "aRightSite", 0.71, 0.555,
                      [GrenadeButton("rampCorner", 0.5625, 0.75, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_aRightSite_from_rampCorner.mp4?alt=media&token=3f111121-be5b-49af-bcaa-1cc025d7a8bc")
        ]),
        GrenadeButton(.tsmoke, "snipers", 0.7, 0.425,
                      [GrenadeButton("ramp", 0.605, 0.705, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_snipers_from_ramp.mp4?alt=media&token=a52b804a-9756-4b1b-84c6-47dd822a4bfc")
        ]),
        GrenadeButton(.tsmoke, "snipersDoor", 0.74, 0.435,
                      [GrenadeButton("construction", 0.505, 0.7225, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_snipersDoor_from_construction.mp4?alt=media&token=c7ffb8f6-85cf-4ddd-a601-d3d575bbb055"),
                       GrenadeButton("constructionCorner", 0.525, 0.785, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_snipersDoor_from_constructionCorner.mp4?alt=media&token=bc19274d-aba9-4a98-b251-2c5ca070fda9"),
                       GrenadeButton("rampCorner", 0.5625, 0.75, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_snipersDoor_from_rampCorner.mp4?alt=media&token=537fa600-3f0e-44e2-b1d1-5a703a4418d5")
        ]),
        GrenadeButton(.tsmoke, "constructionPeek", 0.515, 0.71,
                      [GrenadeButton("tSpawn", 0.445, 0.825, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_constructionPeek_from_tSpawn.mp4?alt=media&token=8a12773a-b4b0-4a23-928d-92cd836018ec")
        ]),
        GrenadeButton(.tsmoke, "window", 0.4175, 0.3,
                      [GrenadeButton("mid", 0.3, 0.4825, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_window_from_mid.mp4?alt=media&token=00c89fbb-e13e-4590-87b7-d76a1c2d2207")
        ]),
        GrenadeButton(.tsmoke, "ctSpawn", 0.505, 0.325,
                      [GrenadeButton("mid", 0.3, 0.445, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_ctSpawn_from_mid.mp4?alt=media&token=6ba7dbb8-8b16-4d95-a072-5ddb14e966ab")
        ]),
        GrenadeButton(.tsmoke, "ctSpawnAndElevator", 0.46, 0.375,
                      [GrenadeButton("mid", 0.36, 0.44, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_ctSpawnAndElevator_from_mid.mp4?alt=media&token=5329f8c1-3840-4c37-8e97-6720f3dff9c9")
        ]),
        GrenadeButton(.tsmoke, "elevator", 0.5325, 0.42,
                      [GrenadeButton("mid", 0.3, 0.47, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_elevator_from_mid.mp4?alt=media&token=2e1ebc2e-b4df-4725-8352-83b8add9ae19")
        ]),
        GrenadeButton(.tsmoke, "bLeftSide", 0.1725, 0.27,
                      [GrenadeButton("stairs", 0.21, 0.49, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_bLeftSite_from_stairs.mp4?alt=media&token=ebd5aa49-1ffd-403e-92f3-c86e46ae412e"),
                       GrenadeButton("tSpawn", 0.21, 0.585, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_bLeftSite_from_tSpawn.mp4?alt=media&token=85383d43-a876-4500-812b-477f52f89675")
        ]),
        GrenadeButton(.tsmoke, "bRightSide", 0.225, 0.28,
                      [GrenadeButton("stairs", 0.21, 0.49, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_bRightSite_from_stairs.mp4?alt=media&token=1a76e9f7-7135-43f8-8790-117ebbc27987"),
                       GrenadeButton("tSpawn", 0.21, 0.585, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_bRightSite_from_tSpawn.mp4?alt=media&token=e43d0fc1-0e40-40e3-b355-454dcf0ecafd")
        ]),
        GrenadeButton(.tsmoke, "leftGenerator", 0.32, 0.21,
                      [GrenadeButton("stairs", 0.16, 0.42, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_leftGenerator_from_stairs.mp4?alt=media&token=cc5a5593-a27b-4145-9c71-0aa6769640ef")
        ]),
        GrenadeButton(.tsmoke, "rightGenerator", 0.32, 0.2825,
                      [GrenadeButton("stairs", 0.19, 0.45, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_rightGenerator_from_stairs.mp4?alt=media&token=c034f4f2-de55-4044-9a60-ce4059a608b6")
        ]),
        GrenadeButton(.tsmoke, "bottomWindow", 0.385, 0.245,
                      [GrenadeButton("stairs", 0.1725, 0.49, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_bottomWindow_from_stairs.mp4?alt=media&token=ea2372bb-ddcc-462c-87cb-b4660e6ed990")
        ]),


        GrenadeButton(.ctsmoke, "construction", 0.5225, 0.5825,
                      [GrenadeButton("elevator", 0.585, 0.51, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_construction_from_elevator.mp4?alt=media&token=34dd5cdb-a202-486c-9171-5d78bc09e718")
        ]),
        GrenadeButton(.ctsmoke, "ramp", 0.585, 0.63,
                      [GrenadeButton("elevator", 0.545, 0.43, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_ramp_from_elevator.mp4?alt=media&token=9ff42d22-2b30-4f0e-befd-7ad9ceb5f2b0"),
                       GrenadeButton("snipersDoor", 0.74, 0.435, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_ramp_from_snipersDoor.mp4?alt=media&token=caec5631-e698-4bd8-a886-5cd217a5465b")
        ]),
        GrenadeButton(.ctsmoke, "mid", 0.375, 0.465,
                      [GrenadeButton("sandbags", 0.445, 0.34, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_mid_from_sandbags.mp4?alt=media&token=7d6bd9a5-fe58-4b5b-a4cd-c04f134dbedd")
        ]),
        GrenadeButton(.ctsmoke, "stairs", 0.18, 0.425,
                      [GrenadeButton("bSite", 0.26, 0.19, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_stairs_from_bSite.mp4?alt=media&token=15202103-d301-404c-88d2-66dd5c078dd8")
        ]),
        GrenadeButton(.ctsmoke, "stairsEntrance", 0.24, 0.425,
                      [GrenadeButton("window", 0.43, 0.26, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_smoke_stairsEntrance_from_window.mp4?alt=media&token=dbaaf3fe-1cac-4fdb-b67b-8dd08a2af399")
        ]),

        
        GrenadeButton(.fire, "headshot", 0.755, 0.515,
                      [GrenadeButton("construction", 0.505, 0.715, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_fire_headshot_from_construction.mp4?alt=media&token=6ed95010-1087-4054-94d3-b62bf9bfe5e3"),
                       GrenadeButton("constructionCorner", 0.525, 0.785, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_fire_headshot_from_constructionCorner.mp4?alt=media&token=5592f1a9-6149-4c58-a78f-f801a02f609d")
        ]),
        GrenadeButton(.fire, "sandbags", 0.7475, 0.775,
                      [GrenadeButton("ramp", 0.565, 0.65, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_fire_sandbags_from_ramp.mp4?alt=media&token=19bb621e-e425-4065-9bb0-93ac30108f78")
        ]),
        GrenadeButton(.fire, "window", 0.415, 0.295,
                      [GrenadeButton("mid", 0.3, 0.4825, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_fire_window_from_mid.mp4?alt=media&token=efcf0ae3-9ddf-435f-893f-26bf838f515f"),
                       GrenadeButton("midHalls", 0.285, 0.55, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_fire_window_from_midHalls.mp4?alt=media&token=f466fb5a-0d05-46b5-94ef-8b7bdaa13fe9")
        ]),
        GrenadeButton(.fire, "midHalls", 0.295, 0.54,
                      [GrenadeButton("window", 0.395, 0.33, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_fire_midHalls_from_window.mp4?alt=media&token=55e97a80-c966-4fb9-900f-450d8ea2d4b4")
        ]),
        GrenadeButton(.fire, "bSite", 0.26, 0.185,
                      [GrenadeButton("stairs", 0.19, 0.45, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_fire_bSite_from_stairs.mp4?alt=media&token=138fd868-94eb-4fa7-b839-fb1b08c4449f")
        ]),
        GrenadeButton(.fire, "bBackSite", 0.14, 0.165,
                      [GrenadeButton("stairs", 0.155, 0.445, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_fire_bBackSite_from_stairs.mp4?alt=media&token=28c0f667-c750-4dcb-a35e-6056f7678cd9")
        ]),
        GrenadeButton(.fire, "bCorner", 0.24, 0.36,
                      [GrenadeButton("stairs", 0.19, 0.45, "https://firebasestorage.googleapis.com/v0/b/csgo-app-c0921.appspot.com/o/videos%2Fvertigo%2Fvertigo_fire_bCorner_from_stairs.mp4?alt=media&token=d6f5f972-65d4-4c45-90d1-53d7bbf7db34")
        ])
    ]

    let targetArray: [GrenadeButton]!
    let type: GrenadeType!
    let location: String!
    let url: String!
    let xMult: CGFloat!
    let yMult: CGFloat!
    
    private override init(frame: CGRect) {
        targetArray = []
        type = nil
        location = nil
        url = nil
        xMult = nil
        yMult = nil
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    private init(_ type: GrenadeType, _ location: String, _ xMult: CGFloat, _ yMult: CGFloat, _ targetArray: [GrenadeButton]) {
        self.targetArray = targetArray
        self.type = type
        self.location = location
        self.url = ""
        self.xMult = xMult
        self.yMult = yMult
        
        super.init(frame: CGRect())
        setupButton()
        addTarget(MinimapVC(), action: #selector(MinimapVC.grenadeButtonPressed), for: .touchUpInside)
    }
    
    private init(_ location: String, _ xMult: CGFloat, _ yMult: CGFloat, _ url: String) {
        self.type = .target
        self.targetArray = []
        self.location = location
        self.url = url
        self.xMult = xMult
        self.yMult = yMult
        
        super.init(frame: CGRect())
        setupButton()
        addTarget(MinimapVC(), action: #selector(MinimapVC.targetButtonPressed), for: .touchUpInside)
    }
    
    private func setupButton() {
        switch type {
            case .tsmoke:
                setImage(UIImage(named: "TSmoke_Icon"), for: .normal)
            case .ctsmoke:
                setImage(UIImage(named: "CTSmoke_Icon"), for: .normal)
            case .fire:
                setImage(UIImage(named: "Fire_Icon"), for: .normal)
            case .flashbang:
                setImage(UIImage(named: "Flashbang_Icon"), for: .normal)
            case .he:
                setImage(UIImage(named: "HE_Icon"), for: .normal)
            case .target:
                setImage(UIImage(named: "Target_Icon"), for: .normal)
            case .none:
                break
        }
    }
}
