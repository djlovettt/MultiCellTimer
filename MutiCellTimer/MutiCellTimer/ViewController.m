//
//  ViewController.m
//  MutiCellTimer
//
//  Created by djlovettt on 17/7/27.
//  Copyright © 2017年 WisdomParents. All rights reserved.
//

#import "ViewController.h"
#import "TimerTableViewCell.h"
#import "CellModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSTimer *cellTimer;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSMutableArray <CellModel *> *modelDatas;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

@implementation ViewController

/**
 测试数据
 */
- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[
                        @{@"endTime":@"2017-07-27 15:26:55"},
                        @{@"endTime":@"2017-07-28 15:26:55"},
                        @{@"endTime":@"2017-07-28 15:26:55"},
                        @{@"endTime":@"2017-07-29 15:26:55"},
                        @{@"endTime":@"2017-07-29 15:26:55"},
                        @{@"endTime":@"2017-08-01 16:26:55"},
                        @{@"endTime":@"2017-08-02 08:26:55"},
                        @{@"endTime":@"2017-08-03 09:20:55"},
                        @{@"endTime":@"2017-08-04 18:26:55"},
                        @{@"endTime":@"2017-08-05 19:20:55"},
                        @{@"endTime":@"2017-08-06 22:22:55"},
                        @{@"endTime":@"2017-08-07 21:30:55"},
                        @{@"endTime":@"2017-08-08 15:26:55"},
                        @{@"endTime":@"2017-08-09 15:26:55"},
                        @{@"endTime":@"2017-08-10 15:26:55"},
                        @{@"endTime":@"2017-08-11 15:26:55"},
                        @{@"endTime":@"2017-08-12 15:26:55"},
                        @{@"endTime":@"2017-08-13 15:26:55"},
                        @{@"endTime":@"2017-08-14 15:26:55"},
                        @{@"endTime":@"2017-08-15 15:26:55"},
                        @{@"endTime":@"2017-08-16 15:26:55"},
                        @{@"endTime":@"2017-08-17 15:26:55"},
                        @{@"endTime":@"2017-08-18 15:26:55"},
                        @{@"endTime":@"2017-08-19 15:26:55"},
                        @{@"endTime":@"2017-08-20 15:26:55"}
                        ];
    }
    return _dataSource;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [_cellTimer invalidate];
    _cellTimer = nil;
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myTableView.rowHeight = 44;
    self.myTableView.tableFooterView = [UIView new];
    
    _modelDatas = [NSMutableArray new];
    for (NSDictionary *dic in self.dataSource) {
        CellModel *model = [CellModel new];
        [model setValuesForKeysWithDictionary:dic];
        [_modelDatas addObject:model];
    }
    
    if (!self.cellTimer) {
        self.cellTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.cellTimer forMode:NSRunLoopCommonModes];
    }
}

- (void)timerAction:(NSTimer *)timer {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:Noti_name object:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.modelDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identity = @"cell";
    TimerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        cell = [[TimerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    
    cell.model = self.modelDatas[indexPath.item];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
