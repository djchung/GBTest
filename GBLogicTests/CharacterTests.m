//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by DJ Chung on 11/5/12.
//  Copyright (c) 2012 Charlie Fulton. All rights reserved.
//

#import "CharacterTests.h"
#import "Character.h"
#import "Item.h"

@implementation CharacterTests
{
    // 1
    NSDictionary *_characterDetailJson;
    Character *_testGuy;
}
// 2
-(void)setUp {
    // 3
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class] URLForResource:@"character"
                                                                   withExtension:@"json"];
    // 4
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    // 5
    id json = [NSJSONSerialization JSONObjectWithData:sampleData options:kNilOptions
                                                error:&error];
    STAssertNotNil(json, @"no test data");
    _characterDetailJson = json;
    _testGuy = [[Character alloc]initWithCharacterDetailData:_characterDetailJson];
    
}

-(void)tearDown {
    // 6
    _characterDetailJson = nil;
}

// 1
- (void)testCreateCharacterFromDetailJson {
    // 2
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertNotNil(testGuy1, @"Could not create character from detail json. Wrong");
    
    // 3
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    STAssertNotNil(testGuy2, @"Could not create character from nil data");
}

- (void)testCreateCharacterFromDetailJsonProps
{
    STAssertEqualObjects(_testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thum url is wrong");
    STAssertEqualObjects(_testGuy.name, @"Hagrel", @"name is wrong");
    STAssertEqualObjects(_testGuy.waistItem.name,@"Girdle of the Queen's Champion", @"name is wrong");
    

}
@end
