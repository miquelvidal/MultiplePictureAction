//
//  MkDbAlbumThumbnail.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/3/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MkDbAlbum;

@interface MkDbAlbumThumbnail : NSManagedObject

@property (nonatomic, retain) UIImage* imatge;
@property (nonatomic, retain) MkDbAlbum *album;

@end
