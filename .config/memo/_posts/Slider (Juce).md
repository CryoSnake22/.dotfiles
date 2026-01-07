# Slider (Juce)

**File:** `/Users/charlo/dev/JUCE_PROJECTS/AudioTest/Source/PluginEditor.cpp`

## Notes

In .h file declare it as

```cpp
juce::Slider midiVolume;
```

```cpp
setSize(400, 300);

midiVolume.setSliderStyle(juce::Slider::LinearBarVertical);
midiVolume.setRange(0.0, 127.0, 1.0);
midiVolume.setTextBoxStyle(juce::Slider::NoTextBox, false, 90, 0);
midiVolume.setPopupDisplayEnabled(true, false, this);
midiVolume.setTextValueSuffix(" Volume");
midiVolume.setValue(1.0);

addAndMakeVisible(&midiVolume);
```

make sure to go in `resized()` and set bounds with

```cpp
midiVolume.setBounds(40, 30, 20, getHeight()-60)
```

Otherwise it won't draw
