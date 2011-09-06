//
//  ShopList.m
//  TXMenu
//
//  Created by Peng on 11-9-1.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "ShopList.h"
#import "TXMenuAppDelegate.h"
#import "MenuDetail.h"
@implementation ShopList

@synthesize list;

-(void)viewDidLoad{
	NSArray *array = [[NSArray alloc] initWithObjects:@"第一款商品",@"商品名称",@"商品名称:Toy Story 2",@"商品名称:Monsters ,Inc.",
					  @"商品名称:Friding Nemo",@"商品名称:The Incredibles",@"商品名称:Cares",@"商品名称:Retatouille",@"商品名称:WALL-E",@"商品名称:Up",@"商品名称:Toy Story 3",
					  @"商品名称:Cars 2",@"商品名称:The Bear and the Bow",@"商品名称:Newt",nil];
	self.list = array;
	[array release];
	[super viewDidLoad];
}
-(void)viewDidUnload{
	self.list = nil;
	[childController release];
	[super viewDidUnload];
}
-(void)dealloc{
	[list release];
	[childController release];
	[super dealloc];
}

#pragma mark -
#pragma mark Table Data Source Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	static NSString *ShopListCellIdentifier = @"ShopListCellIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ShopListCellIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ShopListCellIdentifier] autorelease];
	}
	
	UIImage *image = [UIImage imageNamed:@"goods.jpg"];
	cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
	cell.imageView.image = image;
	//cell.imageView.image.size = []
	
	cell.detailTextLabel.text = @"商品详细描述⋯⋯";
	
	NSUInteger row = [indexPath row];
	NSString *rowString = [list objectAtIndex:row];
	cell.textLabel.text = rowString;
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	[rowString release];
	return cell;
	
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	if(childController == nil)
		childController = [[MenuDetail alloc] initWithNibName:@"MenuList" bundle:nil];
	
	childController.title = @"Disclosure button Pressed";
	NSUInteger row = [indexPath row];
	
	NSString *selectedMovie = [list objectAtIndex:row];
	NSString *detailMessage = [[NSString alloc] initWithFormat:@"You pressed the disclosure button for %@.", selectedMovie];
	//childController.message = detailMessage;
	childController.title = selectedMovie;
	[detailMessage release];
	[self.navigationController pushViewController:childController animated:YES];
}

@end






















