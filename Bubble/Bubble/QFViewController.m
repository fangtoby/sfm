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
	
	self.writing = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-16.0f, self.view.bounds.size.height/2 - 16.0f, 32.0f, 32.0f)];
	self.writing.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	self.writing.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
	self.writing.hidesWhenStopped = YES;
	self.writing.tag = 1000;
	[self.view addSubview:self.writing];
	[self.writing startAnimating];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshStatusLabel:) name:@"NotificationRefreshStatus" object:Nil];
	
}
-(void)refreshStatusLabel:(NSNotification *) notification
{
	
	[self.sourceStatus setText:[notification object]];
	if (!self.animated) {
		CGRect dstFrame = self.animateView.frame;
		dstFrame.origin.y -= 200;
		[UIView animateWithDuration:0.8 animations:^{
			self.animateView.frame = dstFrame;
			self.animateView.alpha = 1.0;
		}];
		self.animated = YES;
		sleep(5);
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
