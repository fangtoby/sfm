//
//  QFViewController.h
//  Bubble
//
//  Created by 方燕良 on 3/7/14.
//  Copyright (c) 2014 adways. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *animateView;

@property (strong, nonatomic) IBOutlet UILabel *sourceStatus;

@property (strong, nonatomic) IBOutlet UIButton *animateRemove;

@property (nonatomic) BOOL animated;

-(void)refreshStatusLabel:(NSNotification *)notification;

- (IBAction)removeAnimate:(id)sender;

@end
