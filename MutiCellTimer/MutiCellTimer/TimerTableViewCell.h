//
//  TimerTableViewCell.h
//  MutiCellTimer
//
//  Created by djlovettt on 17/7/27.
//  Copyright © 2017年 WisdomParents. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CellModel;

#define Noti_name @"CellTimer"

@interface TimerTableViewCell : UITableViewCell

@property (nonatomic, strong) CellModel *model;
@end
