//
//  NSObject+api.m
//  Bubble
//
//  Created by 方燕良 on 3/7/14.
//  Copyright (c) 2014 adways. All rights reserved.
//

#import "NSObject+api.h"
#import "NSObject+param.h"
#import "NSObject+util.h"

@implementation Api

-(NSDictionary *) rootApiCall:(NSString *) location
{
	NSDictionary *dic = [NSDictionary alloc];
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",SERVER_URL,location]];
	dic = [[NSDictionary alloc] initWithContentsOfURL:url];
	return dic;
}

-(NSDictionary *) apiGetWordList
{
	return [self rootApiCall:@"data/word.plist"];
}


@end
