//
//  NSObject+util.h
//  Bubble
//
//  Created by 方燕良 on 3/7/14.
//  Copyright (c) 2014 adways. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util:NSObject

-(NSString *)getUuid;

-(NSString *)getDocumentsPath:(NSString *)fileName;

-(BOOL)fileExist:(NSString *) path;

-(BOOL)writeToFile:(NSMutableDictionary *) mdic fileName:(NSString *) fileName;

-(NSMutableDictionary *)getLocalDataByName:(NSString *) fileName;

@end
