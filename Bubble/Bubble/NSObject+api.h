//
//  NSObject+api.h
//  Bubble
//
//  Created by 方燕良 on 3/7/14.
//  Copyright (c) 2014 adways. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Api:NSObject

-(NSDictionary *)rootApiCall:(NSString *) location;

-(NSDictionary *)apiGetWordList;

@end
