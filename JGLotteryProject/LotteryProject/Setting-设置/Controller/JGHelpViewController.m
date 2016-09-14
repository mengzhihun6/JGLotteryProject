//
//  JGHelpViewController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGHelpViewController.h"
#import "JGHtmlViewController.h"

#import "JGHtml.h"

@interface JGHelpViewController ()

@property (nonatomic, strong) NSMutableArray *htmls;

@end

@implementation JGHelpViewController

- (NSMutableArray *)htmls {
    if (!_htmls) {
        _htmls = [NSMutableArray array];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
//        JGLog(@"%@",array);
        for (NSDictionary *dict in array) {
            
            JGHtml *html = [JGHtml mj_objectWithKeyValues:dict];
            
            [_htmls addObject:html];
        }
        
    }
    
    return _htmls;
}

/*
 _html	NSTaggedPointerString *	0xa150022475441829
 _title	__NSCFString *	@"如何领奖？"	0x00007fef81f59800
 _ID	__NSCFString *	@"howtoprize"	0x00007fef81f30440
 */
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"帮助";
    
    [self setUpGroup0];
    

}

- (void)setUpGroup0 {
    
    //创建组模型
    JGGroupItem *group = [[JGGroupItem alloc] init];
    
    group.items = self.htmls;
    
    [self.groups addObject:group];
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JGGroupItem *group = self.groups[indexPath.section];
    
    JGHtml *html = group.items[indexPath.row];
    
    JGHtmlViewController *htmlVC = [[JGHtmlViewController alloc] init];
    htmlVC.html = html;
    
    [self.navigationController pushViewController:htmlVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
