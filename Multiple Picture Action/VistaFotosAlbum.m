//
//  VistaFotosAlbum.m
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "VistaFotosAlbum.h"

@interface VistaFotosAlbum ()

@end

@implementation VistaFotosAlbum
@synthesize unAlbum;
@synthesize lesFotos;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    unAlbum = [MkTransporter getObjectFromNSString:@"album"];
    lesFotos = unAlbum.imatges.allObjects;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//CollectionView Functions
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //return [assets count];
    return  lesFotos.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VistaCellaFotosAlbum *cell = (VistaCellaFotosAlbum*) [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier  forIndexPath:indexPath];
    
    if (unAlbum){
        MkDbImg* unaImatge = [lesFotos objectAtIndex:indexPath.item];
        cell.unaImatge = unaImatge;
        [cell actualitzaDades];
        
        //NSLog(@"MkFoto: fotoAfegida %@", [cell.laFoto.asset defaultRepresentation].url);
    }
    return cell;
}

//per fer comback

-(IBAction)fet :(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
