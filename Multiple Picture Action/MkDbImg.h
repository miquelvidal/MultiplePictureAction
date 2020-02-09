//
//  MkDbImg.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MkDbAlbum, MkDbImgThumbnail;

@interface MkDbImg : NSManagedObject

@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSNumber * seleccionada;
@property (nonatomic, retain) MkDbAlbum *album;
@property (nonatomic, retain) MkDbImgThumbnail *thumbnail;

@end
