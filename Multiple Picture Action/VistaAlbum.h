//
//  VistaAlbum.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/3/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import <AssetsLibrary/AssetsLibrary.h>

#import "VistaCellaAlbum.h"

#import "MkDbAlbum.h"
#import "MkDbAlbumThumbnail.h"
#import "MkDbImg.h"
#import "MkDbImgThumbnail.h"

#import "MkTransporter.h"
#import "MkAlbumLoader.h"

#import "VistaEntrada.h"

static NSString *CellIdentifier = @"VistaCellaAlbum";

@interface VistaAlbum : UICollectionViewController <NSFetchedResultsControllerDelegate> {
    ALAssetsLibrary *library;
}
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(IBAction)refrescaAlbums:(id) sender;
-(IBAction)seleccionadesFotosPop:(id)sender;
@end
