//
//  VistaFotosAlbum.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import <AssetsLibrary/AssetsLibrary.h>

#import "VistaCellaFotosAlbum.h"

#import "MkDbAlbum.h"
#import "MkDbAlbumThumbnail.h"
#import "MkDbImg.h"
#import "MkDbImgThumbnail.h"

#import "MkTransporter.h"
#import "MkAlbumLoader.h"

static NSString *CellIdentifier = @"VistaCellaFotosAlbum";

@interface VistaFotosAlbum : UICollectionViewController

@property(nonatomic) MkDbAlbum* unAlbum;
@property(nonatomic) NSArray* lesFotos;

-(IBAction)fet :(id)sender;

@end
