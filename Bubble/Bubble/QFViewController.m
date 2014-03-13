//
//  QFViewController.m
//  Bubble
//
//  Created by 方燕良 on 3/7/14.
//  Copyright (c) 2014 adways. All rights reserved.
//

#import "QFViewController.h"
#import "NSObject+param.h"
#import <QuartzCore/CoreAnimation.h>


@interface QFViewController ()

@end

@implementation QFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.writing = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-16.0f, self.view.bounds.size.height/2 - 16.0f, 32.0f, 32.0f)];
	self.writing.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	self.writing.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
	self.writing.hidesWhenStopped = YES;
	self.writing.tag = 1000;
	[self.view addSubview:self.writing];
	[self.writing startAnimating];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshStatusLabel:) name:@"NotificationRefreshStatus" object:Nil];
	
	
	[self.transform.layer setBackgroundColor:[UIColor orangeColor].CGColor];
	
	CATransition *transition = [CATransition animation];
	transition.duration = 3.7;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	transition.type = kCATransitionReveal;
	transition.subtype = kCATransitionFromLeft;
	transition.fillMode = kCAFillModeForwards;
	transition.delegate = self;
	[self.transform.layer addAnimation:transition forKey:nil];
	[self.transform exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
	
	CATransform3D rotate = CATransform3DMakeRotation(degreesToRadian(45), 1, 0, 0);
	self.transform.layer.transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 200);
}

CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}
CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}

-(void)refreshStatusLabel:(NSNotification *) notification
{
	
	[self.sourceStatus setText:[notification object]];
	if (!self.animated) {
		CGRect dstFrame = self.animateView.frame;
		dstFrame.origin.y -= 200;
		
		[UIView animateWithDuration:1.0 delay:2.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
			self.animateView.frame = dstFrame;
			self.animateView.alpha = 1.0;
		} completion:^(BOOL finished) {
			
		}];
		self.animated = YES;
		[self.writing stopAnimating];
	}
	
}

- (IBAction)removeAnimate:(id)sender {
	NSLog(@"ds");
	CGRect dstFrame = self.animateView.frame;
	if (self.animated) {
		dstFrame.origin.y += 200;
	}else{
		dstFrame.origin.y -= 200;
	}
	NSLog(@"%f",dstFrame.origin.y);
	[UIView animateWithDuration:0.8 animations:^{
		self.animateView.frame = dstFrame;
		if (self.animated) {
			self.animateView.alpha = 0.0;
			self.animated = NO;
		}else{
			self.animateView.alpha = 1.0;
			self.animated = YES;
		}
	}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
