
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
import RNGdt from 'react-native-gdt';

// TODO: What to do with the module?
RNGdt;
```
  