//
//  GameScene.m
//  PlayingWithSpriteLight
//
//  Created by Michael Vilabrera on 8/26/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
    background.size = self.size;
    background.zPosition = 0;
    background.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    [self addChild:background];
    
    for (NSInteger i = 1; i < 4; i++) {
        SKSpriteNode *stone = [SKSpriteNode spriteNodeWithImageNamed:@"stone"];
        stone.position = CGPointMake(i * 250, self.frame.size.height / 2);
        [stone setScale:0.6];
        stone.zPosition = 1;
        [self addChild:stone];
    }
    
    NSString *emitterPath = [[NSBundle mainBundle] pathForResource:@"fire" ofType:@"sks"];
    SKEmitterNode *fireEmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:emitterPath];
    fireEmitter.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    fireEmitter.name = @"fireEmitter";
    fireEmitter.zPosition = 1;
    fireEmitter.targetNode = self;
    [self addChild:fireEmitter];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [self childNodeWithName:@"fireEmitter"].position = CGPointMake(location.x, location.y);
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
}

@end
