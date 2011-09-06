//
//  RootViewController.h
//  TXMenu
//
//  Created by Peng on 11-9-1.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShopList;

@interface RootViewController : UITableViewController {
	NSArray *sortList;
	ShopList *childController;
}

@property (nonatomic,retain)NSArray *sortList;

@end
