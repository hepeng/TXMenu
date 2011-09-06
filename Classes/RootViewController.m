//
//  RootViewController.m
//  TXMenu
//
//  Created by Peng on 11-9-1.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "SecondLevelViewController.h"
#import "ShopList.h"


@implementation RootViewController
@synthesize sortList;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    self.title = @"TXMenu";
	
	NSArray *array = [[NSArray alloc] initWithObjects:@"商品名称:WALL-E",@"商品名称:Up",@"商品名称:Toy Story 3",
					  @"商品名称:Cars 2",@"商品名称:The Bear and the Bow",@"商品名称:Newt",nil];
	

	self.sortList = array;
	[array release];
	[super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)viewDidUnload{
	self.sortList = nil;
	[super viewDidUnload];
}
-(void)dealloc{
	[sortList release];
	[super dealloc];
}
/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sortList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	NSUInteger row = [indexPath row];
	NSString *rowString = [sortList objectAtIndex:row];
	cell.textLabel.text = rowString;
	//cell.imageView.image = controller.rowImage;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	[rowString release];
    return cell;
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//NSUInteger row = [indexPath row];
	//SecondLevelViewController *nextController = [self.sortList objectAtIndex:row];
	//[self.navigationController pushViewController:nextController animated:YES];
	
	if(childController == nil)
		childController = [[ShopList alloc] initWithNibName:@"ShopList" bundle:nil];
	
	childController.title = @"Disclosure button Pressed";
	NSUInteger row = [indexPath row];
	
	NSString *selectedMovie = [sortList objectAtIndex:row];
	NSString *detailMessage = [[NSString alloc] initWithFormat:@"You pressed the disclosure button for %@.", selectedMovie];
	//childController.message = detailMessage;
	childController.title = selectedMovie;
	[detailMessage release];
	[self.navigationController pushViewController:childController animated:YES];
	
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}


@end

