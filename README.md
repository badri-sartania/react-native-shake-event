![react-native-shake-event](https://cdn.rawgit.com/jadsonlourenco/react-native-shake-event/master/media/promo.jpg)

[![npm](https://img.shields.io/npm/v/react-native-shake-event.svg)](https://www.npmjs.com/package/react-native-shake-event)
[![npm](https://img.shields.io/npm/dt/react-native-shake-event.svg)](https://www.npmjs.com/package/react-native-shake-event)
[![react-native channel on discord](https://img.shields.io/badge/discord-react--native%40reactiflux-738bd7.svg?style=flat-square)](https://discord.gg/0ZcbPKXt5bXsb3os)

Add the shake event on your React Native mobile app, giving to users improved usability. Enjoy!

## Demo

<img src="https://cdn.rawgit.com/jadsonlourenco/react-native-shake-event/master/media/demo.gif" width="480" height="270" alt="react-native-shake-event">

## Install

```shell
$ npm install react-native-shake-event --save
```

##### Link (required)

`react-native link react-native-shake-event`

##### Link (iOS manually)

1. Add the `ios/RNShakeEvent.xcodeproj` file to your Xcode project [Demo](https://facebook.github.io/react-native/img/AddToLibraries.png);
2. Add the `Products/libRNShakeEvent.a` file to **Build Phases**  [Demo](https://facebook.github.io/react-native/img/AddToBuildPhases.png).

This step is described here: [Linking Libraries](https://facebook.github.io/react-native/docs/linking-libraries-ios.html#content).

## Usage

```js
import RNShakeEvent from 'react-native-shake-event';

class App extends React.Component {
  componentDidMount() {    
    RNShakeEvent.onEnded(() => {
      console.debug('Device shaked.');
    });
  }

  componentWillUnmount() {
    RNShakeEvent.remove();
  }
}
```

## API

### RNShakeEvent

#### onBegan(Function?)

Start listening the shake event and handle a callback function "on began".

#### onEnded(Function?)

Start listening the shake event and handle a callback function "on ended".

#### remove(Function?)

Stop to listening the shake event, recommended to prevent memory leak.

## Issues

1. On *debug mode* this event also handle the **DevMenu**.
2. [Submit here](https://github.com/jadsonlourenco/react-native-shake-event/issues).

## License

MIT
