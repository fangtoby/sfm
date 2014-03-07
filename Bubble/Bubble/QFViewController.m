//
//  QFViewController.m
//  Bubble
//
//  Created by 方燕良 on 3/7/14.
//  Copyright (c) 2014 adways. All rights reserved.
//

#import "QFViewController.h"

@interface QFViewController ()

@end

@implementation QFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshStatusLabel:) name:@"NotificationRefreshStatus" object:Nil];
	
}
-(void)refreshStatusLabel:(NSNotification *) notification
{
	[self.sourceStatus setText:[notification object]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
