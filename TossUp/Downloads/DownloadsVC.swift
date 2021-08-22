//
//  DownloadsVC.swift
//  TossUp
//
//  Created by Carter Burzlaff on 10/10/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

let tagSize = [
    "380.4 MB",
    "634.8 MB",
    "517.4 MB",
    "497.9 MB",
    "513.0 MB",
    "530.3 MB",
    "341.4 MB",
    "728.8 MB"
]


import UIKit

class DownloadsVC: UIViewController {
    
    var titleView: UIView!
    var table: UITableView!
    let backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        
        titleView = createTitleView(title: "Downloads")
        setupTableView()
    }
    
    private func setupTableView() {
        table = UITableView(frame: CGRect.zero, style: .grouped)
        table.register(DownloadsTableViewCell.self, forCellReuseIdentifier: "DownloadsTableViewCell")
        table.delegate = self
        table.dataSource = self
        
        table.backgroundColor = backgroundColor
        table.sectionHeaderHeight = 0
        table.rowHeight = 40
        table.separatorStyle = .none
                
        view.addSubview(table)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}

extension DownloadsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        maps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DownloadsTableViewCell", for: indexPath) as! DownloadsTableViewCell
        cell.mapLabel.text = maps[indexPath.row]
        cell.sizeLabel.text = tagSize[indexPath.row]
        cell.setMap(maps[indexPath.row])
        cell.delegate = self
        return cell
    }
}

func mapAssetsTag(_ map: String) -> Set<String> {
    switch map {
        case "Dust 2":
            return Set([
                "dust2_fire_aCar_from_aLongDoors",
                "dust2_fire_aSite_from_cat",
                "dust2_fire_bBackSite_from_upperTunnels",
                "dust2_fire_bWindow_from_upperTunnelsExit",
                "dust2_smoke_aCross_from_aLong",
                "dust2_smoke_aLong_from_boxes",
                "dust2_smoke_aLong_from_tSpawn",
                "dust2_smoke_bCar_from_upperTunnelsCratePillar",
                "dust2_smoke_bCross_from_lowerTunnels",
                "dust2_smoke_bDoors_from_upperTunnelsCorner",
                "dust2_smoke_bDoors_from_upperTunnelsCrate",
                "dust2_smoke_bPlat_from_upperTunnelsPillar",
                "dust2_smoke_bSite_from_upperTunnelsDoor",
                "dust2_smoke_cat_from_lowerCat",
                "dust2_smoke_ctCross_from_xBox",
                "dust2_smoke_midCross_from_ctSpawn",
                "dust2_smoke_midDoors_from_tSpawn",
                "dust2_smoke_xBox_from_carCorner",
                "dust2_smoke_xBox_from_tSpawn",
            ])
        case "Mirage":
            return Set([
                "mirage_fire_connector_from_midPeek",
                "mirage_fire_firebox_from_tetris",
                "mirage_fire_palace_from_connector",
                "mirage_fire_palace_from_underPalace",
                "mirage_fire_sandwich_from_tRoof",
                "mirage_fire_snipers_from_midBoxes",
                "mirage_fire_triple_from_tetris",
                "mirage_fire_underPalace_from_aRamp",
                "mirage_fire_underPalace_from_Palace",
                "mirage_smoke_aRamp_from_ninja",
                "mirage_smoke_aRamp_from_triple",
                "mirage_smoke_aSite_from_tRoof",
                "mirage_smoke_bench_from_apps",
                "mirage_smoke_cat_from_midBoxes",
                "mirage_smoke_ctSpawn_from_tetris",
                "mirage_smoke_ctSpawn_from_tFloor",
                "mirage_smoke_ctSpawn_from_tSpawn",
                "mirage_smoke_jungleAndConnector_from_tetris",
                "mirage_smoke_jungleAndConnector_from_tRoof",
                "mirage_smoke_jungleAndConnector_from_underpass",
                "mirage_smoke_leftArch_from_apps",
                "mirage_smoke_marketDoor_from_apps",
                "mirage_smoke_marketWindow_from_apps",
                "mirage_smoke_mid_from_tSpawn",
                "mirage_smoke_palace_from_connector",
                "mirage_smoke_palace_from_underPalace",
                "mirage_smoke_rightArch_from_apps",
                "mirage_smoke_snipers_from_midBoxes",
                "mirage_smoke_snipers_from_underpass",
                "mirage_smoke_stairs_from_tetris",
                "mirage_smoke_stairs_from_tFloor",
            ])
        case "Inferno":
            return Set([
                "inferno_fire_aSite_from_arch",
                "inferno_fire_bBackSite_from_banana",
                "inferno_fire_bDark_from_banana",
                "inferno_fire_bSite_from_church",
                "inferno_fire_bSiteClose_from_banana",
                "inferno_fire_flowerBoost_from_bananaPeek",
                "inferno_smoke_arch_from_flowers",
                "inferno_smoke_aSite_from_flowers",
                "inferno_smoke_balcony_from_altMid",
                "inferno_smoke_bSite_from_banana",
                "inferno_smoke_coffin_from_banana",
                "inferno_smoke_coffin_from_bananaLogs",
                "inferno_smoke_ctSpawn_from_banana",
                "inferno_smoke_ctSpawn_from_bananaLog",
                "inferno_smoke_leftMid_from_flowers",
                "inferno_smoke_leftMid_from_mid",
                "inferno_smoke_libraryCross_from_door",
                "inferno_smoke_pit_from_altMid.mp4",
                "inferno_smoke_rightMid_from_flowers",
                "inferno_smoke_rightMid_from_mexico",
                "inferno_smoke_topMid_from_tSpawn",
            ])
        case "Cache":
            return Set([
                "cache_fire_bBackSite_from_sunroom",
                "cache_fire_bSite_from_sunroom",
                "cache_fire_checkers_from_bHalls",
                "cache_fire_whitebox_from_bottomBoost",
                "cache_smoke_aCross_from_aLong",
                "cache_smoke_aCross_from_aMain",
                "cache_smoke_aCross_from_squeaky",
                "cache_smoke_aDefault_from_aLong",
                "cache_smoke_aMain_from_truck",
                "cache_smoke_bHalls_from_bSite",
                "cache_smoke_bHalls_from_heaven",
                "cache_smoke_bMain_from_bHalls",
                "cache_smoke_boost_from_sandbags",
                "cache_smoke_bSite_from_sunroom",
                "cache_smoke_cat_from_aLong",
                "cache_smoke_checkers_from_bHalls",
                "cache_smoke_connector_from_tSpawn",
                "cache_smoke_garage_from_connecterWindow",
                "cache_smoke_garage_from_connectorDoor",
                "cache_smoke_garage_from_whitebox",
                "cache_smoke_hell_from_sunroom",
                "cache_smoke_leftMid_from_garage",
                "cache_smoke_lowerHighway_from_useless",
                "cache_smoke_rightMid_from_garage",
                "cache_smoke_upperHighway_from_vent",
            ])
        case "Overpass":
            return Set([
                "overpass_fire_aSite_from_bathroom",
                "overpass_fire_bBarrels_from_connector",
                "overpass_smoke_aDefault_from_aLong",
                "overpass_smoke_aDefault_from_woodDoor",
                "overpass_smoke_aShort_from_upperTunnelsExit",
                "overpass_smoke_aSite_from_highway",
                "overpass_smoke_aStairs_from_aLong",
                "overpass_smoke_aStairs_from_highway",
                "overpass_smoke_bank_from_aLong",
                "overpass_smoke_bank_from_aShort",
                "overpass_smoke_bank_from_woodDoor",
                "overpass_smoke_bathroom_from_tSpawn",
                "overpass_smoke_bridge_from_alley",
                "overpass_smoke_bridge_from_water",
                "overpass_smoke_bSite_from_alley",
                "overpass_smoke_bSite_from_connectorDoor",
                "overpass_smoke_heaven_from_connectorDoor",
                "overpass_smoke_heaven_from_water",
                "overpass_smoke_leftSidePillar_from_alley",
                "overpass_smoke_rightSidePillar_from_connectorDoor",
                "overpass_smoke_rightSidePillar_from_monster",
                "overpass_smoke_truck_from_highway",
            ])
        case "Train":
            return Set([
                "train_fire_bDefault_from_brownHalls",
                "train_fire_grey_from_brownHalls",
                "train_fire_ladderDoor_from_topLadder",
                "train_fire_sandwich_from_tMain",
                "train_smoke_aConnector_from_mail",
                "train_smoke_aLeftSite_from_mail",
                "train_smoke_aRightSite_from_topLadder",
                "train_smoke_bConnector_from_brownHalls",
                "train_smoke_betweenBlueAndOrange_from_tSpawnTrainLeft",
                "train_smoke_bLeftSite_from_brownHalls",
                "train_smoke_bLower_from_brownHalls",
                "train_smoke_bombTrain_from_tSpawn",
                "train_smoke_bUpper_from_brownHalls",
                "train_smoke_greenPeek_from_topLadder",
                "train_smoke_leftBlue_from_tSpawn",
                "train_smoke_leftEBox_from_tSpawnTrainLeft",
                "train_smoke_leftEBox_from_tSpawnTrainRight",
                "train_smoke_leftGreen_from_topLadder",
                "train_smoke_leftIvy_from_alley",
                "train_smoke_rightIvy_from_alley",
                "train_smoke_rightIvy_from_topLadder",
                "train_smoke_tMain_from_oldBomb",
            ])
        case "Nuke":
            return Set([
                "nuke_fire_blue_from_silo",
                "nuke_fire_bNook_from_bottomRamp",
                "nuke_fire_bSite_from_bottomRamp",
                "nuke_smoke_aMain_from_roof",
                "nuke_smoke_aSite_from_lobby",
                "nuke_smoke_blue_from_outside",
                "nuke_smoke_firstWall_from_tContainer",
                "nuke_smoke_garage_from_outside",
                "nuke_smoke_garage_from_tContainer",
                "nuke_smoke_midCross_from_tSpawn",
                "nuke_smoke_outside_from_blue",
                "nuke_smoke_outside_from_outsideGarage",
                "nuke_smoke_outsideDeep_from_ctSpawn",
                "nuke_smoke_rampBoxes_from_trophyRoom",
                "nuke_smoke_rampCross_from_trophyRoom",
                "nuke_smoke_secondWall_from_outside",
                "nuke_smoke_trophyRoom_from_rampCross",
            ])
        case "Vertigo":
            return Set([
                "vertigo_fire_bBackSite_from_stairs",
                "vertigo_fire_bCorner_from_stairs",
                "vertigo_fire_bSite_from_stairs",
                "vertigo_fire_headshot_from_construction",
                "vertigo_fire_headshot_from_constructionCorner",
                "vertigo_fire_midHalls_from_window",
                "vertigo_fire_sandbags_from_ramp",
                "vertigo_fire_window_from_mid",
                "vertigo_fire_window_from_midHalls",
                "vertigo_smoke_aLeftSite_from_ramp",
                "vertigo_smoke_aLeftSite_from_rampCorner",
                "vertigo_smoke_aRightSite_from_rampCorner",
                "vertigo_smoke_bLeftSite_from_stairs",
                "vertigo_smoke_bLeftSite_from_tSpawn",
                "vertigo_smoke_bottomWindow_from_stairs",
                "vertigo_smoke_bRightSite_from_stairs",
                "vertigo_smoke_bRightSite_from_tSpawn",
                "vertigo_smoke_construction_from_elevator",
                "vertigo_smoke_constructionPeek_from_tSpawn",
                "vertigo_smoke_ctSpawn_from_mid",
                "vertigo_smoke_ctSpawnAndElevator_from_mid",
                "vertigo_smoke_elevator_from_mid",
                "vertigo_smoke_leftGenerator_from_stairs",
                "vertigo_smoke_mid_from_sandbags",
                "vertigo_smoke_ramp_from_elevator",
                "vertigo_smoke_ramp_from_snipersDoor",
                "vertigo_smoke_rightGenerator_from_stairs",
                "vertigo_smoke_snipers_from_ramp",
                "vertigo_smoke_snipersDoor_from_construction",
                "vertigo_smoke_snipersDoor_from_constructionCorner",
                "vertigo_smoke_snipersDoor_from_rampCorner.mp4",
                "vertigo_smoke_stairs_from_bSite",
                "vertigo_smoke_stairsEntrance_from_window",
                "vertigo_smoke_window_from_mid",
            ])
        default: return Set([])
    }
}
