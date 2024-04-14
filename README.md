# image-sequence-animation

This package develop for image animations. You can use in React-Native(typescript) projects.

### Why i created this package?

I created with props because the package was using old implementation techiques (reference package : https://github.com/madsleejensen/react-native-image-sequence). For example Android build implementation was old version, methods etc.
It's using sample wrapper around **iOS** `UIImageView.animationImages` and **Android** `AnimationDrawable`

### Features

The package was support only loop animation but with this package you can change this. How?

- For example you want to start animation once when the screen open, you need to set `loop:false` and `isFirstStart:true`

- For example you want to start animation with reverse animation `loop:false` and `reverse:true`

## Installation

```sh
npm install image-sequence-animation
```

## Usage

```js
import ImageSequenceAnimationView from 'image-sequence-animation';

export const images = [
  require('./assets/example.1png'),
  require('./assets/example.2png'),
  require('./assets/example.3png'),
  require('./assets/example.4png'),
];

<ImageSequenceAnimationView
  images={images}
  style={{ width: 100, height: 100 }}
/>;
```

## Props

|     props      |    types    | defaultValues | isRequired |
| :------------: | :---------: | :-----------: | :--------: |
|     images     |   `Array`   |               |   `true`   |
|     style      | `ViewStyle` |               |   `true`   |
| framePerSecond |  `number`   |     `24`      |  `false`   |
|      loop      |   `bool`    |    `true`     |  `false`   |
|    reverse     |   `bool`    |    `false`    |  `false`   |
|  isFirstStart  |   `bool`    |    `false`    |  `false`   |

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
