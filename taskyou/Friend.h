//
//  Friend.h
//  taskyou
//
//  Created by 羽田 健太郎 on 2014/08/03.
//  Copyright (c) 2014年 me.jumbeeee.ken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * update_at;

- (void)updateSelf;

+ (NSArray*)getAllFrined;
+ (void)setFriend:(NSString*)name;
+ (void)updateWithFriendName:(NSString*)name;
+ (void)makeDummy;

@end
