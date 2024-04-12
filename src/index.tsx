import {
  requireNativeComponent,
  UIManager,
  Platform,
  Image,
  type ViewStyle,
} from 'react-native';

import {
  bool,
  shape,
  arrayOf,
  string,
  number,
  type InferProps,
} from 'prop-types';
import React, { Component } from 'react';

const LINKING_ERROR =
  `The package 'image-sequence-animation' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type StyleProps = {
  style?: ViewStyle;
};

const propTypes = {
  startFrameIndex: number,
  images: arrayOf(
    shape({
      uri: string.isRequired,
    })
  ).isRequired,
  loop: bool,
  framesPerSecond: number,
  reverse: bool,
  isFirstStart: bool,
};

type ImageSequenceProps = InferProps<typeof propTypes>;

class ImageSequenceAnimationView extends Component<
  ImageSequenceProps & StyleProps
> {
  render() {
    let normalized: any = this.props.images.map((e: any) =>
      Image.resolveAssetSource(e)
    );

    // reorder elements if start-index is different from 0 (beginning)
    if (this.props.startFrameIndex !== undefined) {
      normalized = [
        ...normalized.slice(this.props.startFrameIndex),
        ...normalized.slice(0, this.props.startFrameIndex),
      ];
    }
    return (
      <RTCImageSequenceAnimationView {...this.props} images={normalized} />
    );
  }
}

const ComponentName = 'ImageSequenceAnimationView';

const RTCImageSequenceAnimationView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<ImageSequenceProps & StyleProps>(ComponentName)
    : () => {
      throw new Error(LINKING_ERROR);
    };

export default ImageSequenceAnimationView;
