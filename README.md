# image-sequence-animation

This package develop for image animations

## Installation

```sh
npm install image-sequence-animation
```

## Usage

```js
import ImageSequenceAnimationView from 'image-sequence-animation';

const images = [
  require('./assets/example.1png'),
  require('./assets/example.2png'),
  require('./assets/example.3png'),
  require('./assets/example.4png'),
];

<ImageSequenceAnimationView images={images} />;
```

## Props

|   props    |    types    | defaultValues | isRequired |
| :--------: | :---------: | :-----------: | :--------: |
|   images   |   `Array`   |               |   `true`   |
|    loop    |   `bool`    |    `true`     |  `false`   |
|  reverse   |   `bool`    |    `false`    |  `false`   |
| isFirstRun |   `bool`    |    `false`    |  `false`   |
|   style    | `ViewStyle` |               |   `true`   |

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
