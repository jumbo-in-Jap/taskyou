//
//  Task.h
//  taskyou
//
//  Created by 羽田 健太郎 on 2014/08/03.
//  Copyright (c) 2014年 me.jumbeeee.ken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Task : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * clientName;
@property (nonatomic, retain) NSDate * date;

@end
