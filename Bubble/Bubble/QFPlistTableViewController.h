//
//  QFPlistTableViewController.h
//  Bubble
//
//  Created by 方燕良 on 3/8/14.
//  Copyright (c) 2014 adways. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFPlistTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain,nonatomic) UITableView *tableView;
@property (retain,nonatomic) NSDictionary *theDic;
@property (retain,nonatomic) NSArray *theKeys;

@end
