//
//  MkAssetFetcher.h
//  MultiPicAction
//
//  Created by Miquel Isidre Vidal Carretero on 1/13/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreData/CoreData.h>
#import "MkDbAssetIn.h"

@protocol MkAssetFetcherDelegate
- (void) assetAdded;
- (void) assetFailed;
@end

@interface MkAssetFetcher : NSObject

@property(nonatomic) id <MkAssetFetcherDelegate> elDelegat;
@property(nonatomic) NSMutableArray* arrayDiposit;
@property(nonatomic) NSArray* arrayStringUrls;

-(void) startFetching:(NSManagedObjectContext*) context withLibrary:(ALAssetsLibrary*)library;

@end
