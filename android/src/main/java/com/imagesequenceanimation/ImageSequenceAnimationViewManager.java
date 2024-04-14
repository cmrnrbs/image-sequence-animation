package com.imagesequenceanimation;

import android.graphics.Color;
import android.view.View;

import androidx.annotation.NonNull;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import java.util.ArrayList;

public class ImageSequenceAnimationViewManager extends SimpleViewManager<RCTImageSequenceAnimationView> {
  public static final String REACT_CLASS = "ImageSequenceAnimationView";

  @Override
  @NonNull
  public String getName() {
    return REACT_CLASS;
  }

  @Override
  @NonNull
  public RCTImageSequenceAnimationView createViewInstance(ThemedReactContext reactContext) {
    return new RCTImageSequenceAnimationView(reactContext);
  }

  @ReactProp(name = "images")
  public void setImages(final RCTImageSequenceAnimationView view, ReadableArray images) {
      ArrayList<String> uris = new ArrayList<>();
      for (int index = 0; index < images.size(); index++) {
          ReadableMap map = images.getMap(index);
          uris.add(map.getString("uri"));
      }

      view.setImages(uris);
    }

  @ReactProp(name = "framesPerSecond")
  public void setFramesPerSecond(final RCTImageSequenceView view, Integer framesPerSecond) {
        view.setFramesPerSecond(framesPerSecond);
  }

  @ReactProp(name = "loop")
  public void setLoop(final RCTImageSequenceAnimationView view, Boolean loop) {
      view.setLoop(loop);
  }


  @ReactProp(name = "isFirstStart")
  public void setStart(final RCTImageSequenceAnimationView view, Boolean isFirstStart) {
      view.setStart(isFirstStart);
  }

  @ReactProp(name = "reverse")
  public void setReverse(final RCTImageSequenceAnimationView view, Boolean reverse) {
    view.setReverse(reverse);
  }
}
