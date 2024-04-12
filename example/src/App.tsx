import * as React from 'react';

import { StyleSheet, Text, TouchableWithoutFeedback, View } from 'react-native';
import ImageSequenceAnimationView from 'image-sequence-animation';

export default function App() {
  const [isOpen, setOpen] = React.useState(false);

  const toggleOpen = () => {
    setOpen(!isOpen);
  };

  return (
    <View style={styles.container}>
      <Text>Menu Status : {isOpen ? 'Open' : 'Close'}</Text>
      <TouchableWithoutFeedback onPress={toggleOpen}>
        <Text>Click!</Text>
      </TouchableWithoutFeedback>
      <ImageSequenceAnimationView
        images={images}
        style={styles.box}
        loop={false}
        reverse={!isOpen}
        isFirstStart={false}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 56,
    height: 56,
    marginVertical: 20,
  },
});

export const images = [
  require('../assets/menu_cancel_green_0.png'),
  require('../assets/menu_cancel_green_1.png'),
  require('../assets/menu_cancel_green_2.png'),
  require('../assets/menu_cancel_green_3.png'),
  require('../assets/menu_cancel_green_4.png'),
  require('../assets/menu_cancel_green_5.png'),
  require('../assets/menu_cancel_green_6.png'),
  require('../assets/menu_cancel_green_7.png'),
  require('../assets/menu_cancel_green_8.png'),
];
