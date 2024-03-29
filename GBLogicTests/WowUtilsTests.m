//
//  WowUtilsTests.m
//  GuildBrowser
//
//  Created by DJ Chung on 11/5/12.
//  Copyright (c) 2012 Charlie Fulton. All rights reserved.
//

#import "WowUtilsTests.h"
#import "WoWUtils.h"

@implementation WowUtilsTests

-(void)testCharacterClassNameLookup {
    // 2
    STAssertEqualObjects(@"Warrior",
                         [WoWUtils classFromCharacterType:1],
                         @"ClassType should be Warrior");
    STAssertFalse([@"Mage" isEqualToString:[WoWUtils classFromCharacterType:2]],
                  nil);
    // 4
    STAssertTrue([@"Paladin" isEqualToString:[WoWUtils classFromCharacterType:2]],
                 nil);
    // add the rest as an exercise
}
- (void)testRaceTypeLookup {
    STAssertEqualObjects(@"Human", [WoWUtils raceFromRaceType:1], nil);
    STAssertEqualObjects(@"Orc", [WoWUtils raceFromRaceType:2], nil);
    STAssertFalse([@"Night Elf" isEqualToString:[WoWUtils raceFromRaceType:45]],nil);
    // add the rest as an exercise
}
- (void)testQualityLookup {
    STAssertEquals(@"Grey", [WoWUtils qualityFromQualityType:1], nil);
    STAssertFalse([@"Purple" isEqualToString:[WoWUtils qualityFromQualityType:10]],nil);
    // add the rest as an exercise
}

@end
