//
//  MkDbAlbum.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/3/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MkDbAlbumThumbnail, MkDbImg;

@interface MkDbAlbum : NSManagedObject

@property (nonatomic, retain) NSString * nom;
@property (nonatomic, retain) NSNumber * totalImg;
@property (nonatomic, retain) NSNumber * seleccionadesImg;
@property (nonatomic, retain) NSNumber * totes;
@property (nonatomic, retain) NSSet *imatges;
@property (nonatomic, retain) MkDbAlbumThumbnail *thumbnail;
@end

@interface MkDbAlbum (CoreDataGeneratedAccessors)

- (void)addImatgesObject:(MkDbImg *)value;
- (void)removeImatgesObject:(MkDbImg *)value;
- (void)addImatges:(NSSet *)values;
- (void)removeImatges:(NSSet *)values;

@end
