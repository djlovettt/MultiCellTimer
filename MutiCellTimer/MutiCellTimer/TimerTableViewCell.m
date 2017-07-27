//
//  TimerTableViewCell.m
//  MutiCellTimer
//
//  Created by djlovettt on 17/7/27.
//  Copyright © 2017年 WisdomParents. All rights reserved.
//

#import "TimerTableViewCell.h"
#import "CellModel.h"

@interface TimerTableViewCell()

@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic, strong) UILabel  *timeLab;
@property (nonatomic, strong) NSDateFormatter *formatter;
@end

@implementation TimerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.timeLab = [[UILabel alloc] initWithFrame:self.bounds];
        self.timeLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.timeLab];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCenterEvent:) name:Noti_name object:nil];
    }
    return self;
}

- (void)setModel:(CellModel *)model {
    
    _model = model;
    _seconds = [self interval:model.endTime];
}

- (NSDateFormatter *)formatter {
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    return _formatter;
}

/**
 计算距离截止时间的间隔
 */
- (NSInteger)interval:(NSString *)endTime {
    
    NSDate *endDate = [self.formatter dateFromString:endTime];
    NSDate *nowDate = [NSDate date];
    
    NSTimeInterval timeInterval = [endDate timeIntervalSinceDate:nowDate];
    return timeInterval;
}

- (void)notificationCenterEvent:(id)sender {
    
    _seconds--;
    if (_seconds >= 0) {
        long str_day    = _seconds / 86400;
        long str_hour   = (_seconds % 86400) / 3600;
        long str_minute = (_seconds % 3600) / 60;
        long str_second = _seconds % 60;
        
        _timeLab.text = [NSString stringWithFormat:@"%ld天%ld时%ld分%ld秒",str_day,str_hour,str_minute,str_second];
    } else {
        _timeLab.text = @"已截止";
    }
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:Noti_name object:nil];
}

@end
