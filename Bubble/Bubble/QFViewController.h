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

@property (strong, nonatomic) IBOutlet UIView *transform;

@property (nonatomic) BOOL animated;

@property (retain,nonatomic) UIActivityIndicatorView *writing;

-(void)refreshStatusLabel:(NSNotification *)notification;

- (IBAction)removeAnimate:(id)sender;

@end
