//
//  ViewController.m
//  AutoSizeHeightForTableViewCell
//
//  Created by 1134 on 2017/5/11.
//  Copyright © 2017年 1134. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end
/*
 * 要使用自適應TableView cell height有幾個重點，
 * 1.cell 的 Constraints 一定要有可以從最上方連通至最底部的路，
 *   可以不用一條Constraint從頭連到底，
 *   但至少像爬樓梯一樣要有Constraint可以往下。
 * 2.連通往下的Constraint一定必須設定在會依據不同data而增長的元件上。
 * 3.在設置Constraint之前，在 UITableViewCell的size inspector裡面，
 *   Row Height要是Default，而不是custom，不然之後都會優先使用custom的數值。
 * 4.設定好Constraint後，
 *   程式碼只需設定estimatedRowHeight &
 *   tableView.rowHeight = UITableViewAutomaticDimension。
 */

@implementation ViewController

static NSString *cellID = @"cell";
-(void)initTableView
{
    //[self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    NSString *str1 = @"爛 ";
    NSString *str2 = @"真的很傷心，本來是一家很好的店，後來居然變成的這副德性";
    for (int i = 0; i < 5; i++) {
        str1 = [str1 stringByAppendingString:str1];
        str2 = [str2 stringByAppendingString:str2];
        [self setDataToDataArrayWithFirstString:str1 andSecondStr:str2];
    }
    
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setDataToDataArrayWithFirstString:(NSString*)firstStr andSecondStr:(NSString*)secondStr
{
    NSDictionary *dict = [NSDictionary new];
    dict = @{@"first":firstStr,
             @"second":secondStr};
    [self.dataArray addObject:dict];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (indexPath.row < [self.dataArray count]) {
        [cell setCellDataWithDict:self.dataArray[indexPath.row]];
    }
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected!");
}


@end
