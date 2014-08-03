//
//  Friend.m
//  taskyou
//
//  Created by 羽田 健太郎 on 2014/08/03.
//  Copyright (c) 2014年 me.jumbeeee.ken. All rights reserved.
//

#import "Friend.h"
#import <CoreData+MagicalRecord.h>
@implementation Friend

@dynamic name;
@dynamic update_at;

+(NSArray*)getAllFrined
{
    return [Friend MR_findAllSortedBy:@"update_at" ascending:NO];
}

+(void)setFriend:(NSString*)name
{
    Friend* friend = [Friend MR_createEntity];
    friend.name = name;
    friend.update_at = [NSDate new];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+(void)updateWithFriendName:(NSString*)name
{
    Friend* f = [Friend MR_findFirstByAttribute:@"name" withValue:name];
    f.update_at = [NSDate new];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+(void)deleteAll
{
    [Friend MR_truncateAll];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)updateSelf
{
    self.update_at = [NSDate new];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];    
}

+(void)makeDummy
{
    [self deleteAll];
    [self setFriend:@"ken"];
    [self setFriend:@"tarou"];
    [self setFriend:@"yumi"];
}

@end
