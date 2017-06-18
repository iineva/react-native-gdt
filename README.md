
# react-native-gdt

## Getting started

`$ npm install react-native-gdt --save`

### Mostly automatic installation

`$ react-native link react-native-gdt`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-gdt` and add `RNGdt.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNGdt.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNGdtPackage;` to the imports at the top of the file
  - Add `new RNGdtPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-gdt'
  	project(':react-native-gdt').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-gdt/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-gdt')
  	```

## Usage
```javascript
import React from 'react'
import {View, Platform} from 'react-native'
import {Banner} from 'react-native-gdt'

class App extends React.Component {

  state = {
    adHeight: 0,
  }

  render = ()=>(
    <View>
      <Banner
        style={{height: this.state.adHeight}}
        appInfo={Platform.select({
          ios: {appId: '1106150743', placementId: '9020922393993042'},
          android: {appId: '1106224940', placementId: '8020023303787286'},
        })}
        onReceived={()=>this.setState({adHeight: 50})}
        onFailToReceived={(err)=>console.error(err)}
      />
    </View>
  )
}
```
  