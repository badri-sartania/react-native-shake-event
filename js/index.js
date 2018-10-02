/**
 * @providesModule RNShakeEvent
 * @flow
 */
'use strict';

import {NativeEventEmitter, NativeModules, Platform} from 'react-native';

const { RNShakeEvent } = NativeModules;
const shakeEventManagerEmitter = Platform.isTVOS ? null : new NativeEventEmitter(RNShakeEvent);
var subscriptions = [];

class ShakeEvent {  
  static onBegan(callback) {   
    if (shakeEventManagerEmitter === null) {
      console.debug(`RNShakeEvent: tvOS don't support shake gesture.`)      
    } else {
      let listener = shakeEventManagerEmitter.addListener('ShakeEventBegan', () => {
        if (callback) {
          callback();
        }
      });
      subscriptions.push(listener);
    }    
  }
  static onEnded(callback) {   
    if (shakeEventManagerEmitter === null) {
      console.debug(`RNShakeEvent: tvOS don't support shake gesture.`)      
    } else {
      let listener = shakeEventManagerEmitter.addListener('ShakeEventEnded', () => {
        if (callback) {
          callback();
        }
      });
      subscriptions.push(listener);
    }
  }
  static remove(callback) {    
    if (subscriptions.count <= 0) {
      return;
    }
    if (callback) {
      callback();
    }    
    subscriptions.forEach((listener) => {
      listener.remove();
    });
  }
};

module.exports = ShakeEvent;
