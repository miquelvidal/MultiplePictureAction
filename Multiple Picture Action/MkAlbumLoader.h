//
//  MkAlbumLoader.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import <AssetsLibrary/AssetsLibrary.h>

#import "VistaCellaAlbum.h"

#import "MkDbAlbum.h"
#import "MkDbAlbumThumbnail.h"
#import "MkDbImg.h"
#import "MkDbImgThumbnail.h"

#import "MkTransporter.h"

@interface MkAlbumLoader : NSObject
+(void)loadAlbums:(NSManagedObjectContext*)context withAssetLibrary:(ALAssetsLibrary*)library;
+(void)refrescarAlbums;
@end
