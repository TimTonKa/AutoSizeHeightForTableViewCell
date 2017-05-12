//
//  TableViewCell.h
//  AutoSizeHeightForTableViewCell
//
//  Created by 1134 on 2017/5/11.
//  Copyright © 2017年 1134. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

-(void)setCellDataWithDict:(NSDictionary*)dict;

@end
