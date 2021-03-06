//
//  NSObject+util.m
//  Bubble
//
//  Created by 方燕良 on 3/7/14.
//  Copyright (c) 2014 adways. All rights reserved.
//

#import "NSObject+util.h"
#import "NSObject+param.h"

@implementation Util


-(NSString *) getUuid
{
	CFUUIDRef puuid = CFUUIDCreate(Nil);
	CFStringRef uuidString = CFUUIDCreateString(Nil, puuid);
	NSString * result = CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
	CFRelease(puuid);
	CFRelease(uuidString);
	return result;
}

-(NSString *)getDocumentsPath:(NSString *) fileName
{
	//NSDocumentDirectory
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *dir = [paths objectAtIndex:0];
	NSString *path = [dir stringByAppendingPathComponent:fileName];
	return path;
}

-(BOOL)fileExist:(NSString *) path
{
	NSFileManager *fm = [[NSFileManager alloc] init];

	if ([fm fileExistsAtPath:path]) {
		return YES;
	}
	return NO;
}

-(BOOL)fileRemove:(NSString *) fileName
{
	NSString *filePath = [self getDocumentsPath:fileName];
	if ([self fileExist:filePath]) {
		return [NSFILEMANAGER removeItemAtPath:filePath error:nil];
	}
	return NO;
}
-(BOOL)fileCreate:(NSString *) fileName
{
	NSString *filePath = [self getDocumentsPath:fileName];
	if ([self fileExist:filePath]) {
		return YES;
	}
	return [NSFILEMANAGER createFileAtPath:filePath contents:nil attributes:nil];
}

-(BOOL)directoryCreate:(NSString *) directoryName
{
	BOOL isDir = YES;
	NSString *dirPath = [self getDocumentsPath:directoryName];
	if (![NSFILEMANAGER fileExistsAtPath:dirPath isDirectory:&isDir]) {
		return [NSFILEMANAGER createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
	}
	return NO;
}

-(BOOL)writeToFile:(NSDictionary *) mdic fileName:(NSString *) fileName
{
	NSString *filePath = [self getDocumentsPath:fileName];
	NSLog(@"%@",filePath);
	NSString *msg ;
	if ([self fileExist:filePath]) {
		msg = @"update file %@.";
		
	}else{
		msg = @"create file %@";
	}
	NSLog(msg,fileName);
	return [mdic writeToFile:filePath atomically:YES];
}


-(NSDictionary *)getLocalDataByName:(NSString *) fileName
{
	NSString *filePath = [self getDocumentsPath:fileName];
	NSDictionary *data;
	if ([self fileExist:filePath]) {
		data = [[NSDictionary alloc] initWithContentsOfFile:filePath];
	}
	return data;
}

@end
