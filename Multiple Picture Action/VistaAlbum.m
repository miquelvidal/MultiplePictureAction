//
//  VistaAlbum.m
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/3/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "VistaAlbum.h"

@interface VistaAlbum ()

@end

@implementation VistaAlbum

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
    self.managedObjectContext = [MkTransporter getObjectFromNSString:@"managedObjectContext"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Dades collecció

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //treiem la cella (no sé d'on)
    VistaCellaAlbum *cell = (VistaCellaAlbum*) [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier  forIndexPath:indexPath];
    //Busquem l'album que li pertoca
    MkDbAlbum* unMkAlbum = [self.fetchedResultsController objectAtIndexPath:indexPath];
    //Assignem l'album a la cella
    cell.unAlbum = unMkAlbum;
    cell.controller = self;
    //actualitzem les dades de la cella amb les del album
    [cell actualitzar];
    //retornem la cella
    return cell;
}


#pragma mark - Fetched results controller - Copy Paste del 20121225LoadAlbumsCoreData

///ens tornarà tots els MkDbAlbums, ordenats per nom, ho això espero xDD
- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MkDbAlbum" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nom" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}



//Per altre banda quan hi hagi una modificació reactualitzarem la vista 
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.collectionView reloadData];
}

#pragma mark - refresca de dades

- (IBAction)refrescaAlbums:(id)sender{
    //[MkAlbumLoader refrescarAlbums];
    
    VistaEntrada* entrada = [MkTransporter getObjectFromNSString:@"vistaEntrada"];
    [entrada resetejar:nil];
}

#pragma mark - altres per la navegació


-(IBAction)seleccionadesFotosPop:(id)sender{
    NSArray* totesMesAlbum = [MkDbFetcher imatgesSeleccionadesMesAlbum:[MkTransporter getObjectFromNSString:@"managedObjectContext"]];
    NSLog(@" %i imatges (albums inclosos)",totesMesAlbum.count);
    if (totesMesAlbum.count>0){
        VistaEntrada* entrada = [MkTransporter getObjectFromNSString:@"vistaEntrada"];
        [entrada step1Done];
    }

    [self.navigationController popViewControllerAnimated:YES];
}

@end
