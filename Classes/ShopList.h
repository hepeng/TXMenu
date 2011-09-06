//
//  ShopList.h
//  TXMenu
//
//  Created by Peng on 11-9-1.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"
@class MenuDetail;

@interface ShopList : SecondLevelViewController {
	
	NSArray *list;
	MenuDetail *childController;

}
@property(nonatomic,retain) NSArray *list;
@end
