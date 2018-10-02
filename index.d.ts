declare module 'react-native-shake-event' {
  class RNShakeEvent {
    static onBegan(callback?: () => void)
    static onEnded(callback?: () => void)
    static remove(callback?: () => void)
  }

  export default RNShakeEvent
}
