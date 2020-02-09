//
//  MkDbAssetIn.h
//  MultiPicAction
//
//  Created by Miquel Isidre Vidal Carretero on 1/16/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MkDbAssetIn : NSManagedObject

@property (nonatomic, retain) NSString * filename;
@property (nonatomic, retain) NSData * data;

@end
