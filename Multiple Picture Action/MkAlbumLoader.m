//
//  MkAlbumLoader.m
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "MkAlbumLoader.h"

@implementation MkAlbumLoader
+(void)loadAlbums:(NSManagedObjectContext*)context withAssetLibrary:(ALAssetsLibrary*)library{
    
    //primer els borrem
    //delete all objects
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MkDbAlbum" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError* error;
    
    NSArray* fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    for (MkDbAlbum *pasMkAlbum in fetchedObjects) {
        [context deleteObject:pasMkAlbum];
    }
    //després els carreguem
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       
                       // Group enumerator Block
                       void (^assetGroupEnumerator)(ALAssetsGroup *, BOOL *) = ^(ALAssetsGroup *group, BOOL *stop)
                       {
                           if (group == nil)
                           {
                               return;
                           }
                           [group setAssetsFilter:[ALAssetsFilter allPhotos]];
                           if (group.numberOfAssets>0) {                             
                               
                               //Album
                               MkDbAlbum *unMkAlbum = [NSEntityDescription insertNewObjectForEntityForName:@"MkDbAlbum" inManagedObjectContext:context];
                               unMkAlbum.nom = [group valueForProperty:ALAssetsGroupPropertyName];
                               unMkAlbum.totalImg = [NSNumber numberWithInteger:group.numberOfAssets];
                               unMkAlbum.seleccionadesImg = [NSNumber numberWithInt:0];
                               unMkAlbum.totes = [NSNumber numberWithBool:FALSE];
                               //Album miniatura
                               MkDbAlbumThumbnail *unMkAlbumThumbnail = [NSEntityDescription insertNewObjectForEntityForName:@"MkDbAlbumThumbnail" inManagedObjectContext:context];
                               unMkAlbum.thumbnail = unMkAlbumThumbnail;
                               unMkAlbumThumbnail.imatge = [UIImage imageWithCGImage:group.posterImage];
                               //això ho farem "cuando se pueda"
                               dispatch_async(dispatch_get_main_queue(), ^
                                              {
                                                  //Fotos del álbum
                                                  ////Definim l'enumerador
                                                  ALAssetsGroupEnumerationResultsBlock assetEnumerator = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
                                                      if(result != NULL) {
                                                          //La foto
                                                          MkDbImg *unaMkImg = [NSEntityDescription insertNewObjectForEntityForName:@"MkDbImg" inManagedObjectContext:context];
                                                          unaMkImg.url = result.defaultRepresentation.url.absoluteString;
                                                          //La miniatura de la foto
                                                          MkDbImgThumbnail *unaMkImgThumbnail = [NSEntityDescription insertNewObjectForEntityForName:@"MkDbImgThumbnail" inManagedObjectContext:context];
                                                          unaMkImgThumbnail.imatge = [UIImage imageWithCGImage:result.thumbnail];
                                                          unaMkImgThumbnail.imatgeOriginal = unaMkImg;
                                                          unaMkImg.album = unMkAlbum;
                                                          //Test per borrar
                                                          /*
                                                           NSLog(@"AlbumLoader:Representation");
                                                          ALAssetRepresentation* rep = [result defaultRepresentation];
                                                          NSLog(@"AlbumLoader:next iref");
                                                          CGImageRef iref = [rep fullResolutionImage];
                                                          NSLog(@"AlbumLoader:%@",iref);
                                                          NSLog(@"AlbumLoader:url:%@",[rep url]);
                                                      */
                                                    }
                                                  };
                                                  //Invoquem l'enumerador
                                                  [group enumerateAssetsUsingBlock:assetEnumerator];
                                              });
                               //no hem de reloadear la collecció si ho tenim en la taula, no?
                               //[self performSelectorOnMainThread:@selector(reloadCollection) withObject:nil waitUntilDone:YES];
                           }
                           else return;
                       };
                       
                       // Group Enumerator Failure Block
                       void (^assetGroupEnumberatorFailure)(NSError *) = ^(NSError *error) {
                           
                           UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"Album Error: %@ - %@", [error localizedDescription], [error localizedRecoverySuggestion]] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                           [alert show];
                           
                           NSLog(@"A problem occured %@", [error description]);
                       };
                       
                       // Enumerate Albums -- ALAssetsGroupAlbum
                       [library enumerateGroupsWithTypes:ALAssetsGroupLibrary|ALAssetsGroupAlbum
                                              usingBlock:assetGroupEnumerator
                                            failureBlock:assetGroupEnumberatorFailure];
                       
                       
                   });

}

+(void)refrescarAlbums{
    //NSLog(@"Refresshhh");
    ALAssetsLibrary* library = [MkTransporter getObjectFromNSString:@"library"];
    if (library==nil) {
        library = [[ALAssetsLibrary alloc] init];
        [MkTransporter setObject:library forNSString:@"library"];
    }
    
    NSManagedObjectContext* context;
    context = [MkTransporter getObjectFromNSString:@"managedObjectContext"];
    
    
    //això ho farem "cuando se pueda"
    // Load Albums into assetGroups
    [MkAlbumLoader loadAlbums:context withAssetLibrary:library];
}
@end
