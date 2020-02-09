//
//  MkDbFetcher.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "MkDbAlbum.h"
#import "MkDbAlbumThumbnail.h"
#import "MkDbImg.h"
#import "MkDbImgThumbnail.h"


@interface MkDbFetcher : NSObject

+(NSArray*)imatgesSeleccionades:(NSManagedObjectContext*) context;
+(NSArray*)albumsSeleecionats:(NSManagedObjectContext*) context;
+(NSArray*)imatgesSeleccionadesMesAlbum:(NSManagedObjectContext*) context;
+(NSArray*)assetsSeleecionats:(NSManagedObjectContext*) context;

@end
